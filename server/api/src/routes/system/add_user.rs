use actix_multiresponse::Payload;
use dal::{User, UserBuildable};
use proto::AddUserRequest;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};

pub async fn add_user(data: WebData, payload: Payload<AddUserRequest>, session: Session) -> WebResult<Empty> {
    let authorized_user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    if !authorized_user.is_admin {
        return Err(Error::Forbidden("Not an administrator"));
    }

    let new_user = User::create(data.mysql.clone(), UserBuildable {
        name: payload.name.clone(),
        employee_number: payload.employee_id.clone()
    })?;

    if payload.is_admin {
        new_user.set_admin(true)?;
    }

    Ok(Empty)
}