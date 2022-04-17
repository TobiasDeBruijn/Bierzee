use actix_multiresponse::Payload;
use dal::{Notification, User};
use proto::GetListNotificationResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use tracing::instrument;

#[instrument]
pub async fn list(data: WebData, session: Session) -> WebResult<Payload<GetListNotificationResponse>> {
    let notifications = Notification::list(data.mysql.clone(), &session.user_id)?;
    let notifications = notifications.into_iter()
        .filter(|x| !x.completed)
        .map(|x| {
            let user = User::get(data.mysql.clone(), &x.user_id)?.ok_or(Error::NotFound("User not found"))?;
            let notif = proto::Notification {
                id: x.id,
                created_at: x.created_at,
                user: Some(proto::User {
                    id: user.id,
                    login_id: user.login_id,
                    name: user.name,
                }),
                text: x.text
            };
            Ok(notif)
        })
        .collect::<WebResult<Vec<_>>>()?;

    Ok(Payload(GetListNotificationResponse {
        notifications
    }))
}