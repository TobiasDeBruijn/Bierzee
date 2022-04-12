use actix_web::web::ServiceConfig;
use crate::Routable;

mod list;
mod stock;
mod purchase;
mod price;

pub struct BeerRouter;

impl Routable for BeerRouter {
    fn configure(config: &mut ServiceConfig) {
        todo!()
    }
}