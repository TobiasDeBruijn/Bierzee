use actix_multiresponse::Payload;
use proto::PostSetBeerPriceRequest;
use crate::appdata::WebData;
use crate::error::WebResult;
use crate::routes::Empty;
use crate::v1::organization::OrgAdmin;

pub async fn price(data: WebData, session: OrgAdmin, payload: Payload<PostSetBeerPriceRequest>) -> WebResult<Empty> {
    
}
