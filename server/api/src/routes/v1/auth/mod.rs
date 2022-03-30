use actix_web::web;
use actix_web::web::ServiceConfig;
use crate::routes::routable::Routable;

mod login;
mod logout;
mod session;

pub struct AuthRouter;

impl Routable for AuthRouter {
    fn configure(config: &mut ServiceConfig) {
        config
            .service(web::scope("/auth")
                .route("/login", web::post().to(login::login))
                .route("/logout", web::post().to(logout::logout))
                .route("/session", web::get().to(session::session))
            );
    }
}