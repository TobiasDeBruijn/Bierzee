use crate::appdata::AppData;
use crate::config::Config;
use actix_cors::Cors;
use actix_governor::{Governor, GovernorConfig};
use actix_web::{web, App, HttpServer};
use std::sync::Arc;
use tracing::{debug, info, trace};
use tracing_actix_web::TracingLogger;

mod appdata;
mod config;
mod error;
mod services;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    init_tracing();
    info!("Starting {} v{}", env!("CARGO_PKG_NAME"), env!("CARGO_PKG_VERSION"));

    info!("Reading config");
    let config = Config::new().expect("Reading config");

    info!("Creating appdata");
    let appdata = AppData::new(config).expect("Creating appdata");
    let webdata = Arc::new(appdata);

    let server = HttpServer::new(move || {
        App::new()
            .app_data(webdata.clone())
            .wrap(TracingLogger::default())
            .wrap(Cors::permissive())
            .wrap(Governor::new(&GovernorConfig::default()))
            .service(
                web::scope("/api/v1")
                    .route("/login", web::get().to(services::login::login))
                    .route("/beer/drink", web::post().to(services::beer::drink::drink))
                    .route("/beer/drunk", web::get().to(services::beer::drunk::drunk))
                    .route("/beer/price", web::get().to(services::beer::price::price))
                    .route("/payment/pay", web::post().to(services::payment::pay::pay))
                    .route("/payment/broke", web::get().to(services::payment::broke::broke))
                    .route("/payment/balance", web::get().to(services::payment::balance::balance))
                    .route("/system/beer-price", web::post().to(services::system::set_beer_price::set_beer_price))
                    .route("/system/owes", web::get().to(services::system::owes::owes))
                    .route("/system/set-admin", web::post().to(services::system::set_admin::set_admin)),
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
