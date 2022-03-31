use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::Routable;

mod purchase;
mod stock;

pub struct BeerRouter;

impl Routable for BeerRouter {
    fn configure(config: &mut ServiceConfig) {
        config
            .service(web::scope("/beer")
                .route("/purchase", web::post().to(purchase::purchase))
                .route("/stock", web::get().to(stock::stock))
            );
    }
}