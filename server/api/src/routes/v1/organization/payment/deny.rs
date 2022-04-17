use actix_multiresponse::Payload;
use dal::{Notification, Payment};
use proto::PostDenyPaymentRequest;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Empty;
use crate::v1::organization::OrgAdmin;

pub async fn deny(data: WebData, session: OrgAdmin, payload: Payload<PostDenyPaymentRequest>) -> WebResult<Empty> {
    let payment = Payment::get_by_id(data.mysql.clone(), &payload.payment_id)?.ok_or(Error::NotFound("Payment not found"))?;
    if payment.organization_id.ne(&session.user.organization_id) {
        return Err(Error::Forbidden("Organization mismatch"));
    }

    let denied_by = if payload.denied { Some(session.user_id.as_str()) } else { None };
    payment.set_denied(data.mysql.clone(), payload.denied, denied_by)?;

    let notif_text = format!("Uw betaling van €{:.2} is geweigerd door {}", payment.amount_paid, session.user.name);
    let _ = Notification::new(data.mysql.clone(), &payment.paid_by, &notif_text)?;

    Ok(Empty)
}
