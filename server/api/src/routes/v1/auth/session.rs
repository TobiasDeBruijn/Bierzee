use actix_multiresponse::Payload;
use dal::{Organization, User};
use proto::GetSessionResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use tracing::instrument;

#[instrument]
pub async fn session(data: WebData, session: Session) -> WebResult<Payload<GetSessionResponse>> {
    let user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::Unauthorized("Invalid session"))?;
    let org = Organization::get(data.mysql.clone(), &session.user.organization_id)?.ok_or(Error::Unauthorized("Invalid session"))?;

    Ok(Payload(GetSessionResponse {
        session: Some(proto::Session {
            id: session.id.clone(),
            expires_at: session.expires_at,
        }),
        user: Some(proto::User {
            id: user.id,
            name: user.name,
            login_id: user.login_id
        }),
        organization: Some(proto::Organization {
            name: org.name,
            id: org.id,
            code: org.code,
            created_at: org.created_at
        }),
        is_admin: user.is_admin,
    }))
}