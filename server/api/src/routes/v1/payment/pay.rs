use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};
use actix_multiresponse::Payload;
use dal::User;
use proto::PostPayRequest;
use tracing::instrument;

#[instrument]
pub async fn pay(data: WebData, session: Session, payload: Payload<PostPayRequest>) -> WebResult<Empty> {
    let user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::Unauthorized("Invalid session"))?;
    user.pay(time::OffsetDateTime::now_utc().unix_timestamp(), payload.amount)?;

    Ok(Empty)
}
