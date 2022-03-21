use std::str::FromStr;
use actix_multiresponse::Payload;
use proto::GetAboutResponse;

pub async fn about() -> Payload<GetAboutResponse> {
    Payload(GetAboutResponse {
        version: env!("CARGO_PKG_VERSION").into(),
        version_major: i32::from_str(env!("CARGO_PKG_VERSION_MAJOR")).unwrap(),
        version_minor: i32::from_str(env!("CARGO_PKG_VERSION_MINOR")).unwrap(),
        version_patch: i32::from_str(env!("CARGO_PKG_VERSION_PATCH")).unwrap(),
        repository: env!("CARGO_PKG_REPOSITORY").into(),
        authors: env!("CARGO_PKG_AUTHORS").into(),
        license: env!("CARGO_PKG_LICENSE").into()
    })
}