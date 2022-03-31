use actix_multiresponse::Payload;
use dal::{User, UserBuildable};
use proto::AddUserRequest;
use crate::appdata::WebData;
use crate::error::WebResult;
use crate::routes::{Empty, AdminSession};

pub async fn add_user(data: WebData, payload: Payload<AddUserRequest>, _: AdminSession) -> WebResult<Empty> {
    let new_user = User::create(data.mysql.clone(), UserBuildable {
        name: payload.name.clone(),
        employee_number: payload.employee_id.clone()
    })?;

    if payload.is_admin {
        new_user.set_admin(true)?;
    }

    Ok(Empty)
}