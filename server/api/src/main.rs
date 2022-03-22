use crate::appdata::AppData;
use crate::config::Config;
use actix_cors::Cors;
use actix_governor::{Governor, GovernorConfig};
use actix_web::{App, HttpServer, web};
use std::sync::Arc;
use tracing::{debug, info, trace};
use tracing_actix_web::TracingLogger;
use routes::auth;

mod appdata;
mod config;
mod error;
mod routes;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    init_tracing();
    info!("Starting {} v{}", env!("CARGO_PKG_NAME"), env!("CARGO_PKG_VERSION"));

    info!("Reading config");
    let config = Config::new().expect("Reading config");

    info!("Creating appdata");
    let appdata = AppData::new(config).expect("Creating appdata");
    let webdata = actix_web::web::Data::new(Arc::new(appdata));

    let server = HttpServer::new(move || {
        App::new()
            .app_data(webdata.clone())
            .wrap(TracingLogger::default())
            .wrap(Cors::permissive())
            .wrap(Governor::new(&GovernorConfig::default()))
            .service(
                web::scope("/api/v1")
                    .route("/auth/login", web::post().to(auth::login::login))
                    .route("/auth/logout", web::post().to(auth::logout::logout))
                    .route("/auth/session", web::get().to(auth::session::session))
                    .route("/about", web::get().to(routes::about::about))
                    .route("/beer/drink", web::post().to(routes::beer::drink::drink))
                    .route("/beer/drunk", web::get().to(routes::beer::drunk::drunk))
                    .route("/beer/price", web::get().to(routes::beer::price::price))
                    .route("/payment/pay", web::post().to(routes::payment::pay::pay))
                    .route("/payment/broke", web::get().to(routes::payment::broke::broke))
                    .route("/payment/balance", web::get().to(routes::payment::balance::balance))
                    .route("/system/beer-price", web::post().to(routes::system::set_beer_price::set_beer_price))
                    .route("/system/users", web::get().to(routes::system::users::owes))
                    .route("/system/set-admin", web::post().to(routes::system::set_admin::set_admin))
                    .route("/system/add-user", web::post().to(routes::system::add_user::add_user)),
            )
    })
    .bind("[::]:8080")?
    .run();

    info!("Startup complete");
    server.await
}

fn init_tracing() {
    let subscriber = tracing_subscriber::FmtSubscriber::builder()
        .compact()
        .with_max_level(tracing::Level::DEBUG)
        .finish();

    tracing::subscriber::set_global_default(subscriber).expect("Setting default tracing subscriber");

    debug!("Tracing configured");

    info!("Active on INFO level");
    debug!("Active on DEBUG level");
    trace!("Active on TRACE level");
}
