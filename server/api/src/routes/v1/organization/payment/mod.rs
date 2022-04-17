use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::Routable;

mod list;
mod deny;

pub struct PaymentRouter;

impl Routable for PaymentRouter {
    fn configure(config: &mut ServiceConfig) {
        config.service(web::scope("/payment")
            .route("/deny", web::post().to(deny::deny))
            .route("/list", web::get().to(list::list))
        );
    }
}