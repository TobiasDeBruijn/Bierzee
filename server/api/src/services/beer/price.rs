use crate::appdata::WebData;
use crate::error::WebResult;
use crate::services::Session;
use actix_multiresponse::Payload;
use dal::System;
use proto::GetBeerPriceResponse;

pub async fn price(data: WebData, _: Session) -> WebResult<Payload<GetBeerPriceResponse>> {
    let system = System::new(data.mysql.clone())?;
    let beer_price = system.get_beer_price()?;

    Ok(Payload(GetBeerPriceResponse {
        last_updated: beer_price.last_updated,
        price: beer_price.value,
    }))
}
