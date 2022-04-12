use actix_multiresponse::Payload;
use dal::{Organization, User, UserBuildable};
use proto::{PostCreateUserRequest, PostCreateUserResponse};
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::v1::organization::OrgAdmin;

pub async fn create(data: WebData, payload: Payload<PostCreateUserRequest>, session: OrgAdmin) -> WebResult<Payload<PostCreateUserResponse>> {
    let org = Organization::get(data.mysql.clone(), &session.user.organization_id)?.ok_or(Error::NotFound("Organization not found"))?;

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