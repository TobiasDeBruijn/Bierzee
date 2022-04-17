use std::future::Future;
use std::ops::Deref;
use std::pin::Pin;
use actix_web::{FromRequest, HttpRequest, web};
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
        config.service(web::scope("/organization")
            .route("/create", web::post().to(create::create))
            .route("/{id}", web::get().to(get::get))
            .configure(user::UserRouter::configure)
            .configure(payment::PaymentRouter::configure)
            .configure(beer::BeerRouter::configure)
        );
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