use actix_multiresponse::Payload;
use dal::BeerStock;
use proto::PurchaseBeerRequest;
use crate::appdata::WebData;
use crate::error::WebResult;
use crate::routes::{AdminSession, Empty};

pub async fn purchase(data: WebData, session: AdminSession, payload: Payload<PurchaseBeerRequest>) -> WebResult<Empty> {
    BeerStock::purchase(data.mysql.clone(), payload.crates_purchased, payload.amount_paid, &session.user)?;
    Ok(Empty)
}