use actix_multiresponse::Payload;
use actix_web::web;
use dal::{Organization, Payment, PaymentDeniedStatus, User};
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use proto::GetListPaymentsResponse;
use serde::Deserialize;
use crate::v1::organization::OrgAdmin;

#[derive(Deserialize)]
pub struct Query {
    max: Option<usize>,
    /// Should payments that were denied be returned.
    /// Defaults to false
    show_denied: Option<bool>,
}

pub async fn list(data: WebData, session: OrgAdmin, query: web::Query<Query>) -> WebResult<Payload<GetListPaymentsResponse>> {
    let org = Organization::get(data.mysql.clone(), &session.user.organization_id)?.ok_or(Error::NotFound("Organization not found"))?;
    let payments = Payment::list(data.mysql.clone(), &org.id)?;

    // Convert to proto::Payment
    let mut payments = payments.into_iter()
        .map(|x| {
            let made_by = User::get(data.mysql.clone(), &x.paid_by)?.ok_or(Error::NotFound("User not found"))?;
            let denied_by = match x.denied {
                PaymentDeniedStatus::Denied(by) => {
                    let user = User::get(data.mysql.clone(), &by)?.ok_or(Error::NotFound("User not found"))?;
                    Some(proto::User {
                        id: user.id,
                        login_id: user.login_id,
                        name: user.name,
                    })
                },
                PaymentDeniedStatus::None => None
            };

            let payment = proto::Payment {
                user: Some(proto::User {
                    id: made_by.id,
                    login_id: made_by.login_id,
                    name: made_by.name
                }),
                id: x.payment_id,
                denied: denied_by.is_some(),
                denied_by,
                paid_at: x.paid_at,
                amount: x.amount_paid
            };

            Ok(payment)
        })
        .collect::<WebResult<Vec<_>>>()?;

    // Sort by paid_at
    payments.sort_by(|a, b| a.paid_at.cmp(&b.paid_at));

    // If a max is set, apply it
    if let Some(max) = query.max {
        let idx = if max > payments.len() { payments.len() } else { max };
        let _ = payments.split_off(idx);
    }

    // Filter denied payments
    let show_denied = if let Some(denied) = query.show_denied { denied } else { false };
    if !show_denied {
        payments.retain(|x| !x.denied);
    }

    Ok(Payload(GetListPaymentsResponse {
        payments
    }))
}
