use actix_web::web::ServiceConfig;
use crate::Routable;

mod create;
mod admin;

pub struct UserRouter;

impl Routable for UserRouter {
    fn configure(config: &mut ServiceConfig) {
        todo!()
    }
}