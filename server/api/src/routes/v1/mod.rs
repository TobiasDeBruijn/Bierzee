use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::routes::routable::Routable;

mod beer;
mod payment;
mod auth;
mod about;
mod notification;
mod organization;

pub struct V1Router;

impl Routable for V1Router {
    fn configure(config: &mut ServiceConfig) {
        config
            .service(web::scope("/v1")
                .route("/about", web::get().to(about::about))
                .configure(auth::AuthRouter::configure)
                .configure(beer::BeerRouter::configure)
                .configure(payment::PaymentRouter::configure)
                .configure(notification::NotificationRouter::configure)
                .configure(organization::OrganizationRouter::configure)
            );
    }
}