use actix_multiresponse::Payload;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};
use dal::{Payment, User};
use proto::DenyPaymentRequest;

pub async fn deny_payment(data: WebData, session: Session, payload: Payload<DenyPaymentRequest>) -> WebResult<Empty> {
    let authorized_user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    if !authorized_user.is_admin {
        return Err(Error::Forbidden("Not an administrator"));
    }

    let payment = Payment::get_by_id(data.mysql.clone(), &payload.payment_id)?.ok_or(Error::NotFound("Payment not found"))?;
    let denied_by = if payload.denied { Some(&*session.user) } else { None };
    payment.set_denied(data.mysql.clone(), payload.denied, denied_by)?;

    Ok(Empty)
}