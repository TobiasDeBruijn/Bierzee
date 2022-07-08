use crate::appdata::WebData;
use crate::error::Error;
use actix_web::body::BoxBody;
use actix_web::dev::Payload;
use actix_web::{FromRequest, HttpRequest, HttpResponse, Responder};
use dal::{User, UserSession};
use std::future::Future;
use std::ops::Deref;
use std::pin::Pin;

pub mod v1;
pub mod routable;

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

#[derive(Debug)]
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

            session.reset_expiry()?;

            Ok(Self(session))
        })
    }
}

#[derive(Debug)]
pub struct AdminSession(Session);

impl Deref for AdminSession {
    type Target = Session;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl FromRequest for AdminSession {
    type Error = Error;
    type Future = Pin<Box<dyn Future<Output = Result<Self, Self::Error>>>>;

    fn from_request(req: &HttpRequest, payload: &mut Payload) -> Self::Future {
        let session = Session::from_request(req, payload);
        let req = req.clone();

        Box::pin(async move {
            let session = session.await?;
            let data: &WebData = req.app_data().unwrap();

            let authorized_user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::Unauthorized("Invalid session"))?;
            if !authorized_user.is_admin {
                return Err(Error::Forbidden("Not an administrator"));
            }

            Ok(Self(session))
        })
    }
}