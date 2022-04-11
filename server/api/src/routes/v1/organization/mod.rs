use actix_web::web::ServiceConfig;
use crate::Routable;

mod user;

mod get;
mod create;
mod payment;

pub struct OrganizationRouter;

impl Routable for OrganizationRouter {
    fn configure(config: &mut ServiceConfig) {
        todo!()
    }
}