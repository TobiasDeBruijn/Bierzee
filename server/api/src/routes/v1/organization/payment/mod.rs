use actix_web::web::ServiceConfig;
use crate::Routable;

mod list;
mod deny;

pub struct PaymentRouter;

impl Routable for PaymentRouter {
    fn configure(config: &mut ServiceConfig) {
        todo!()
    }
}