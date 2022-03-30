use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};
use actix_multiresponse::Payload;
use dal::User;
use proto::SetAdminRequest;

pub async fn set_admin(data: WebData, session: Session, payload: Payload<SetAdminRequest>) -> WebResult<Empty> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    if !user.is_admin {
        return Err(Error::Forbidden("Not an administrator"));
    }

    let affected_user = User::get(data.mysql.clone(), &payload.employee_id)?.ok_or(Error::NotFound("The requested user does not exist"))?;
    affected_user.set_admin(payload.admin)?;

    Ok(Empty)
}
