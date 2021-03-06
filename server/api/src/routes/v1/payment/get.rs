use actix_multiresponse::Payload;
use actix_web::web;
use serde::Deserialize;
use dal::{Payment, PaymentDeniedStatus, User};
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use tracing::instrument;

#[derive(Debug, Deserialize)]
pub struct Path {
    id: String
}

#[instrument]
pub async fn get(data: WebData, session: Session, path: web::Path<Path>) -> WebResult<Payload<proto::Payment>> {
    let payment = Payment::get_by_id(data.mysql.clone(), &path.id)?.ok_or(Error::NotFound("Payment not found"))?;
    let user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::NotFound("User not found"))?;

    if payment.paid_by.ne(&session.user_id) && !user.is_admin {
        return Err(Error::Forbidden("Payment was not made by this user"));
    }

    let denied_by = match payment.denied {
        PaymentDeniedStatus::Denied(denied_by) => {
            let user = User::get(data.mysql.clone(), &denied_by)?.ok_or(Error::NotFound("User not found"))?;
            Some(proto::User {
                id: user.id,
                login_id: user.login_id,
                name: user.name
            })
        },
        PaymentDeniedStatus::None => None,
    };

    let paid_by_user = User::get(data.mysql.clone(), &payment.paid_by)?.ok_or(Error::NotFound("User not found"))?;

    Ok(Payload(proto::Payment {
        paid_at: payment.paid_at,
        amount: payment.amount_paid,
        denied: denied_by.is_some(),
        user: Some(proto::User {
            name: paid_by_user.name,
            login_id: user.login_id,
            id: paid_by_user.id,
        }),
        denied_by,
        id: payment.payment_id,
    }))
}
