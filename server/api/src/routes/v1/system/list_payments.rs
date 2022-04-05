use actix_multiresponse::Payload;
use actix_web::web;
use dal::{Payment, PaymentDeniedStatus, User};
use proto::ListPaymentResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::AdminSession;
use serde::Deserialize;
use tracing::instrument;

#[derive(Debug, Deserialize)]
pub struct Query {
    max: Option<usize>,
}

#[instrument]
pub async fn list_payments(data: WebData, _: AdminSession, query: web::Query<Query>) -> WebResult<Payload<ListPaymentResponse>> {
    let payments = Payment::list(data.mysql.clone())?;
    let mut payments = payments.into_iter()
        .map(|x| {
            let denied_by = match x.denied {
                PaymentDeniedStatus::Denied(user_id) => {
                    let denied_by = User::get(data.mysql.clone(), &user_id)?.ok_or(Error::NotFound("Could not find user who denied payment"))?;
                    Some(proto::User {
                        employee_id: denied_by.employee_number,
                        name: denied_by.name,
                    })
                },
                PaymentDeniedStatus::None => None,
            };

            let paid_by_user = User::get(data.mysql.clone(), &x.paid_by)?.ok_or(Error::NotFound("User not found"))?;

            Ok(proto::Payment {
                paid_at: x.paid_at,
                amount_paid: x.amount_paid,
                denied: denied_by.is_some(),
                paid_by: Some(proto::User {
                    employee_id: paid_by_user.employee_number,
                    name: paid_by_user.name,
                }),
                denied_by,
                payment_id: x.payment_id,
            })
        })
        .collect::<Result<Vec<_>, Error>>()?;

    payments.sort_by(|a, b| a.paid_at.cmp(&b.paid_at));
    payments.reverse();
        
    if let Some(max) = query.max {
        if max < payments.len() {
            // split_off changes the original vec to be 0..max,
            // The returned value is max..len, we don't care for that
            let _ = payments.split_off(max);
        }
    }

    Ok(Payload(ListPaymentResponse {
        payments
    }))
}