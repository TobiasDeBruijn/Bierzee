use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::services::{Empty, Session};
use actix_multiresponse::Payload;
use dal::User;
use proto::PayRequest;

pub async fn pay(data: WebData, session: Session, payload: Payload<PayRequest>) -> WebResult<Empty> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    user.pay(time::OffsetDateTime::now_utc().unix_timestamp(), payload.amount)?;

    Ok(Empty)
}
