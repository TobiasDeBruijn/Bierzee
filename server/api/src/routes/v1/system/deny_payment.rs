use actix_multiresponse::Payload;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{AdminSession, Empty};
use dal::{Notification, Payment, User};
use proto::DenyPaymentRequest;
use tracing::instrument;

#[instrument]
pub async fn deny_payment(data: WebData, session: AdminSession, payload: Payload<DenyPaymentRequest>) -> WebResult<Empty> {
    let authorized_user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;

    // Retrieve the payment and mark it as denied
    let payment = Payment::get_by_id(data.mysql.clone(), &payload.payment_id)?.ok_or(Error::NotFound("Payment not found"))?;
    let denied_by = if payload.denied { Some(&*session.user) } else { None };
    payment.set_denied(data.mysql.clone(), payload.denied, denied_by)?;

    // Issue a notification for the user
    let text = if payload.denied {
        format!("Betaling van €{:.2} geweigerd door {}", payment.amount_paid, authorized_user.name)
    } else {
        format!("Betaling van €{:.2} geaccepteerd door {}", payment.amount_paid, authorized_user.name)
    };
    Notification::new(data.mysql.clone(), &payment.paid_by, &text)?;

    Ok(Empty)
}