use actix_multiresponse::Payload;
use dal::Notification;
use proto::PostCompleteNotificationRequest;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};
use tracing::instrument;

#[instrument]
pub async fn complete(data: WebData, _: Session, payload: Payload<PostCompleteNotificationRequest>) -> WebResult<Empty> {
    let notification = Notification::get(data.mysql.clone(), &payload.notification_id)?.ok_or(Error::NotFound("Notification not found"))?;
    notification.set_complete(data.mysql.clone(), payload.completed)?;

    Ok(Empty)
}
