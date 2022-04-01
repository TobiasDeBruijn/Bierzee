use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use tracing::info;
use dal::{System, User};
use proto::GetBeerPriceResponse;
use tracing::instrument;

#[instrument]
pub async fn price(data: WebData, _: Session) -> WebResult<Payload<GetBeerPriceResponse>> {
    let system = System::new(data.mysql.clone())?;
    let beer_price = system.get_beer_price()?;

    info!("fetching user with id {}", beer_price.last_updated_by);

    let updated_by = User::get(data.mysql.clone(), &beer_price.last_updated_by)?.ok_or(Error::Internal)?;

    Ok(Payload(GetBeerPriceResponse {
        last_updated: beer_price.last_updated,
        price: beer_price.value,
        last_changed_by_id: beer_price.last_updated_by,
        last_changed_by_name: updated_by.name
    }))
}
