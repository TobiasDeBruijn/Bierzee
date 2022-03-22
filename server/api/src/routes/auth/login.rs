use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use actix_multiresponse::Payload;
use dal::{User, SYSTEM_USER_ID, System};
use proto::{LoginRequest, LoginResponse};

pub async fn login(data: WebData, payload: Payload<LoginRequest>) -> WebResult<Payload<LoginResponse>> {
    if payload.employee_id.eq(&SYSTEM_USER_ID) {
        return Err(Error::Unauthorized("May not log in as system user"));
    }

    let system = System::new(data.mysql.clone())?;
    if system.get_global_password()?.value.ne(&payload.password) {
        return Err(Error::Unauthorized("Invalid password"));
    }

    let user = User::get(data.mysql.clone(), &payload.employee_id)?.ok_or(Error::Unauthorized("Unauthorized"))?;

    let session = user.create_session()?;
    Ok(Payload(LoginResponse {
        session_id: session.id,
        is_admin: user.is_admin,
        name: user.name
    }))
}
