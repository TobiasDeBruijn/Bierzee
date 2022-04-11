use actix_multiresponse::Payload;
use dal::{Organization, User, UserBuildable, UserSession};
use proto::{PostCreateUserRequest, PostCreateUserResponse};
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;

pub async fn create(data: WebData, payload: Payload<PostCreateUserRequest>, session: Session) -> WebResult<Payload<PostCreateUserResponse>> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::NotFound("User not found"))?;
    let org = Organization::get(data.mysql.clone(), &user.organization_id)?.ok_or(Error::NotFound("Organization not found"))?;

    let user = User::create(data.mysql.clone(), UserBuildable {
        organization_id: org.id,
        name: payload.user_name.clone(),
        login_id: payload.user_login_id.clone(),
    })?;

    Ok(Payload(PostCreateUserResponse {
        user: Some(proto::User {
            id: user.id,
            login_id: user.login_id,
            name: user.name
        })
    }))
}