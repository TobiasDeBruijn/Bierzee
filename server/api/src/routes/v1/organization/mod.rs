use std::future::Future;
use std::ops::Deref;
use std::pin::Pin;
use actix_web::{FromRequest, HttpRequest};
use actix_web::dev::Payload;
use actix_web::web::ServiceConfig;
use crate::error::Error;
use crate::Routable;
use crate::routes::Session;

mod user;

mod get;
mod create;
mod payment;
mod beer;

pub struct OrganizationRouter;

impl Routable for OrganizationRouter {
    fn configure(config: &mut ServiceConfig) {
        todo!()
    }
}

pub struct OrgAdmin(Session);

impl Deref for OrgAdmin {
    type Target = Session;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl FromRequest for OrgAdmin {
    type Error = Error;
    type Future = Pin<Box<dyn Future<Output = Result<Self, Self::Error>>>>;

    fn from_request(req: &HttpRequest, payload: &mut Payload) -> Self::Future {
        let session = Session::from_request(req, payload);
        Box::pin(async move {
            let session = session.await?;
            if session.user.is_admin {
                Ok(Self(session))
            } else {
                Err(Error::Forbidden("Not an admin"))
            }
        })
    }
}