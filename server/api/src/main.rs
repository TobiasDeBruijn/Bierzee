use crate::appdata::AppData;
use crate::config::Config;
use actix_cors::Cors;
use actix_governor::{Governor, GovernorConfig};
use actix_web::{App, HttpServer, web};
use std::sync::Arc;
use tracing::{debug, info, trace};
use tracing_actix_web::TracingLogger;
use routes::v1;
use crate::routes::routable::Routable;

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
                    .configure(v1::V1Router::configure)
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
