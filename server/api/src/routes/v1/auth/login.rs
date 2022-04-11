use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use actix_multiresponse::Payload;
use dal::{User, SYSTEM_USER_ID, System};
use proto::{PostLoginRequest, LoginResponse};
use tracing::instrument;

#[instrument]
pub async fn login(data: WebData, payload: Payload<PostLoginRequest>) -> WebResult<Payload<LoginResponse>> {
    if payload.user_login_id.eq(&SYSTEM_USER_ID) {
        return Err(Error::Unauthorized("May not log in as system user"));
    }

    let system = System::new(data.mysql.clone())?;
    if system.get_global_password()?.value.ne(&payload.organization_password) {
        return Err(Error::Unauthorized("Invalid password"));
    }

    let user = User::get(data.mysql.clone(), &payload.user_login_id)?.ok_or(Error::Unauthorized("Unauthorized"))?;

    let session = user.create_session()?;
    Ok(Payload(LoginResponse {
        session_id: session.id,
        is_admin: user.is_admin,
        name: user.name
    }))
}
