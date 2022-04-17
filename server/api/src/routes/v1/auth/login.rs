use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use actix_multiresponse::Payload;
use dal::{User, Organization};
use proto::{PostLoginRequest, PostLoginResponse};
use tracing::instrument;

#[instrument]
pub async fn login(data: WebData, payload: Payload<PostLoginRequest>) -> WebResult<Payload<PostLoginResponse>> {
    if payload.organization_code.eq("SYSTEM") {
        return Err(Error::Unauthorized("Cannot log in as SYSTEM"));
    }

    let organization = Organization::get_by_code(data.mysql.clone(), &payload.organization_code)?.ok_or(Error::Unauthorized("Organization not found"))?;
    if !organization.verify_password(&payload.organization_password, &data.config.pepper)? {
        return Err(Error::Unauthorized("Invalid combination of username and password"));
    }

    let user = User::get_by_login_id(data.mysql.clone(), &payload.user_login_id)?.ok_or(Error::Unauthorized("User not found"))?;

    let session = user.create_session()?;
    Ok(Payload(PostLoginResponse {
        user: Some(proto::User {
            id: user.id,
            login_id: user.login_id,
            name: user.name
        }),
        session: Some(proto::Session {
            id: session.id,
            expires_at: session.expires_at
        }),
        organization: Some(proto::Organization {
            id: organization.id,
            name: organization.name,
            created_at: organization.created_at,
            code: organization.code,
        }),
        is_admin: user.is_admin,
    }))
}
