use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::routes::routable::Routable;

mod balance;
mod list;
mod pay;
mod get;

pub struct PaymentRouter;

impl Routable for PaymentRouter {
    fn configure(config: &mut ServiceConfig) {
        config
            .service(web::scope("/payment")
                .route("/pay", web::post().to(pay::pay))
                .route("/list", web::get().to(list::list))
                .route("/balance", web::get().to(balance::balance))
                .route("/{id}", web::get().to(get::get))
            );
    }
}