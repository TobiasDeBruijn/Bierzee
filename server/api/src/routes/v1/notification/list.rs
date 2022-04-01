use actix_multiresponse::Payload;
use dal::Notification;
use proto::ListNotificationResponse;
use crate::appdata::WebData;
use crate::error::WebResult;
use crate::routes::Session;
use tracing::instrument;

#[instrument]
pub async fn list(data: WebData, session: Session) -> WebResult<Payload<ListNotificationResponse>> {
    let notifications = Notification::list(data.mysql.clone(), &session.user)?;
    let notifications = notifications.into_iter()
        .filter(|x| !x.completed)
        .map(|x| proto::Notification {
            id: x.id,
            created_at: x.created_at,
            user_id: x.user_id,
            text: x.text
        })
        .collect::<Vec<_>>();

    Ok(Payload(ListNotificationResponse {
        notifications
    }))
}