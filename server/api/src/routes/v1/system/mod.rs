use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::routes::routable::Routable;

mod users;
mod set_admin;
mod set_beer_price;
mod add_user;
mod list_payments;
mod deny_payment;
mod beer;

pub struct SystemRouter;

impl Routable for SystemRouter {
    fn configure(config: &mut ServiceConfig) {
        config
            .service(web::scope("/system")
                .route("/beer-price", web::post().to(set_beer_price::set_beer_price))
                .route("/users", web::get().to(users::owes))
                .route("/set-admin", web::post().to(set_admin::set_admin))
                .route("/add-user", web::post().to(add_user::add_user))
                .route("/payments", web::get().to(list_payments::list_payments))
                .route("/deny-payment", web::post().to(deny_payment::deny_payment))
            );
    }
}