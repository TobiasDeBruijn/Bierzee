use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::routes::routable::Routable;

mod drink;
mod drunk;
mod price;

pub struct BeerRouter;

impl Routable for BeerRouter {
    fn configure(config: &mut ServiceConfig) {
        config
            .service(web::scope("/beer")
                .route("/drink", web::post().to(drink::drink))
                .route("/drunk", web::get().to(drunk::drunk))
                .route("/price", web::get().to(price::price))
            );
    }
}
