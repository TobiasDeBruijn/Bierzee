use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::Routable;

mod create;
mod admin;
mod list;

pub struct UserRouter;

impl Routable for UserRouter {
    fn configure(config: &mut ServiceConfig) {
        config.service(web::scope("/user")
            .route("/admin", web::post().to(admin::admin))
            .route("/create", web::post().to(create::create))
            .route("/list", web::get().to(list::list))
        );
    }
}