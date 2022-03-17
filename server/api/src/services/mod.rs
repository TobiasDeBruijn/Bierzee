use crate::appdata::WebData;
use crate::error::Error;
use actix_web::body::BoxBody;
use actix_web::dev::Payload;
use actix_web::{FromRequest, HttpRequest, HttpResponse, Responder};
use dal::UserSession;
use std::future::Future;
use std::ops::Deref;
use std::pin::Pin;

pub mod beer;
pub mod login;
pub mod payment;
pub mod system;

fn get_header(req: &HttpRequest, header: &str) -> Option<String> {
    let value = req.headers().get(header)?;
    value.to_str().map(|x| x.to_string()).ok()
}

pub struct Empty;

impl Responder for Empty {
    type Body = BoxBody;

    fn respond_to(self, _: &HttpRequest) -> HttpResponse<Self::Body> {
        HttpResponse::Ok().finish()
    }
}

pub struct Session(UserSession);

impl Deref for Session {
    type Target = UserSession;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl FromRequest for Session {
    type Error = Error;
    type Future = Pin<Box<dyn Future<Output = Result<Self, Self::Error>>>>;

    fn from_request(req: &HttpRequest, _: &mut Payload) -> Self::Future {
        let req = req.clone();
        Box::pin(async move {
            let auth = get_header(&req, "Authorization").ok_or(Error::Unauthorized("Missing header 'Authorization'"))?;

            let webdata: &WebData = req.app_data().unwrap();
            let session = UserSession::get_by_id(webdata.mysql.clone(), &auth)?.ok_or(Error::Unauthorized("Invalid session"))?;

            if time::OffsetDateTime::now_utc().unix_timestamp() > session.expires_at {
                return Err(Error::Unauthorized("Session has expired"));
            }

            Ok(Self(session))
        })
    }
}
