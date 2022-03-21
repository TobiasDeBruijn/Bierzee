use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use actix_multiresponse::Payload;
use dal::{User, UserBuildable, SYSTEM_USER_ID};
use proto::{LoginRequest, LoginResponse};

pub async fn login(data: WebData, payload: Payload<LoginRequest>) -> WebResult<Payload<LoginResponse>> {
    if payload.employee_id.eq(&SYSTEM_USER_ID) {
        return Err(Error::Unauthorized("May not log in as system user"));
    }

    let user = match User::get(data.mysql.clone(), &payload.employee_id)? {
        Some(x) => x,
        None => User::create(
            data.mysql.clone(),
            UserBuildable {
                employee_number: payload.employee_id.clone(),
                name: payload.name.clone(),
            },
        )?,
    };

    let session = user.create_session()?;
    Ok(Payload(LoginResponse { session_id: session.id, is_admin: user.is_admin }))
}
