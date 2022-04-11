use actix_multiresponse::Payload;
use dal::User;
use proto::PostAdminRequest;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};

pub async fn admin(data: WebData, payload: Payload<PostAdminRequest>, session: Session) -> WebResult<Empty> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::NotFound("User not found"))?;
    if !user.is_admin {
        return Err(Error::Forbidden("Not an admin"));
    }

    let user = User::get(data.mysql.clone(), &payload.user_id)?.ok_or(Error::NotFound("User not found"))?;
    user.set_admin(payload.is_admin)?;

    Ok(Empty)
}