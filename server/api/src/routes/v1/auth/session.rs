use actix_multiresponse::Payload;
use dal::User;
use proto::GetSessionResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use tracing::instrument;

#[instrument]
pub async fn session(data: WebData, session: Session) -> WebResult<Payload<GetSessionResponse>> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    Ok(Payload(GetSessionResponse {
        id: user.employee_number,
        name: user.name,
        is_admin: user.is_admin
    }))
}