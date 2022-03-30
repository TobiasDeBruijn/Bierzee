use actix_multiresponse::Payload;
use dal::{Payment, PaymentDeniedStatus, User};
use proto::ListPaymentResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;

pub async fn list_payments(data: WebData, session: Session) -> WebResult<Payload<ListPaymentResponse>> {
    let authorized_user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    if !authorized_user.is_admin {
        return Err(Error::Forbidden("Not an administrator"));
    }

    let payments = Payment::list(data.mysql.clone())?;
    let payments = payments.into_iter()
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
            })
        })
        .collect::<Result<Vec<_>, Error>>()?;
    
    Ok(Payload(ListPaymentResponse {
        payments
    }))
}