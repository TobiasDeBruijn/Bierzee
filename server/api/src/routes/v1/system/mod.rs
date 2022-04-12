use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::routes::routable::Routable;

mod users;
mod set_beer_price;
mod beer;

pub struct SystemRouter;

impl Routable for SystemRouter {
    fn configure(config: &mut ServiceConfig) {
        config
            .service(web::scope("/system")
                .route("/beer-price", web::post().to(set_beer_price::set_beer_price))
                .route("/users", web::get().to(users::owes))
                .configure(beer::BeerRouter::configure)
            );
    }
}