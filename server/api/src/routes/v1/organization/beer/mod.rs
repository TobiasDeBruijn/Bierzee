use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::Routable;

mod list;
mod stock;
mod purchase;
mod price;

pub struct BeerRouter;

impl Routable for BeerRouter {
    fn configure(config: &mut ServiceConfig) {
        config.service(web::scope("/beer")
            .route("/list", web::get().to(list::list))
            .route("/price", web::post().to(price::price))
            .route("/purchase", web::post().to(purchase::purchase))
            .route("/stock", web::get().to(stock::stock))
        );
    }
}