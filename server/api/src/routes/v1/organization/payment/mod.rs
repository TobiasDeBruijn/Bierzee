use actix_web::web::ServiceConfig;
use crate::Routable;

mod list;

pub struct PaymentRouter;

impl Routable for PaymentRouter {
    fn configure(config: &mut ServiceConfig) {
        todo!()
    }
}