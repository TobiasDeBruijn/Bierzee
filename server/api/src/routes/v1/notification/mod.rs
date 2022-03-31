use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::Routable;

mod complete;
mod list;

pub struct NotificationRouter;

impl Routable for NotificationRouter {
    fn configure(config: &mut ServiceConfig) {
        config
            .service(web::scope("/notification")
                .route("/list", web::get().to(list::list))
                .route("/complete", web::post().to(complete::complete))
            );
    }
}