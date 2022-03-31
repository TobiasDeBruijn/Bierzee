use actix_multiresponse::Payload;
use dal::Notification;
use proto::CompleteNotificationRequest;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};

pub async fn complete(data: WebData, _: Session, payload: Payload<CompleteNotificationRequest>) -> WebResult<Empty> {
    let notification = Notification::get(data.mysql.clone(), &payload.notification_id)?.ok_or(Error::NotFound("Notification not found"))?;
    notification.set_complete(data.mysql.clone(), payload.completed)?;

    Ok(Empty)
}
