use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{AdminSession, Empty};
use actix_multiresponse::Payload;
use dal::User;
use proto::SetAdminRequest;

pub async fn set_admin(data: WebData, _: AdminSession, payload: Payload<SetAdminRequest>) -> WebResult<Empty> {
    let affected_user = User::get(data.mysql.clone(), &payload.employee_id)?.ok_or(Error::NotFound("The requested user does not exist"))?;
    affected_user.set_admin(payload.admin)?;

    Ok(Empty)
}
