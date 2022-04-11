use actix_multiresponse::Payload;
use actix_web::web;
use crate::appdata::WebData;
use serde::Deserialize;
use dal::Organization;
use proto::GetOrganizationResponse;
use crate::error::{Error, WebResult};

#[derive(Deserialize)]
pub struct Path {
    id: String
}

pub async fn get(data: WebData, path: web::Path<Path>) -> WebResult<Payload<GetOrganizationResponse>> {
    let org = Organization::get(data.mysql.clone(), &path.id)?.ok_or(Error::NotFound("Organization not found"))?;
    Ok(Payload(GetOrganizationResponse {
        organization: Some(proto::Organization {
            id: org.id,
            name: org.name,
            code: org.code,
            created_at: org.created_at,
        })
    }))
}