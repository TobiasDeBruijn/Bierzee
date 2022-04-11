use actix_multiresponse::Payload;
use dal::{Organization, OrganizationBuildable, User, UserBuildable};
use proto::{PostCreateOrganizationRequest, PostCreateOrganizationResponse};
use crate::appdata::WebData;
use crate::error::WebResult;

pub async fn create(data: WebData, payload: Payload<PostCreateOrganizationRequest>) -> WebResult<Payload<PostCreateOrganizationResponse>> {
    let org = Organization::create(data.mysql.clone(), OrganizationBuildable {
        name: payload.organization_name.clone(),
        password: payload.organization_password.clone()
    }, &data.config.pepper)?;

    let user = User::create(data.mysql.clone(), UserBuildable {
        organization_id: org.id.clone(),
        name: payload.user_name.clone(),
        login_id: payload.user_login_id.clone(),
    })?;

    Ok(Payload(PostCreateOrganizationResponse {
        organization: Some(proto::Organization {
            name: org.name,
            id: org.id,
            code: org.code,
            created_at: org.created_at,
        }),
        user: Some(proto::User {
            id: user.id,
            login_id: user.login_id,
            name: user.name
        })
    }))
}
