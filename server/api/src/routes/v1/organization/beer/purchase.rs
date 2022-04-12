use actix_multiresponse::Payload;
use dal::BeerStock;
use proto::PostPurchaseBeerStockRequest;
use crate::appdata::WebData;
use crate::error::WebResult;
use crate::routes::Empty;
use crate::v1::organization::OrgAdmin;

pub async fn purchase(data: WebData, session: OrgAdmin, payload: Payload<PostPurchaseBeerStockRequest>) -> WebResult<Empty> {
    BeerStock::purchase(data.mysql.clone(), payload.crates_purchased, payload.amount_paid, &session.user.id, &session.user.organization_id)?;
    Ok(Empty)
}
