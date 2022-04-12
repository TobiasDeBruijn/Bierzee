use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{AdminSession, Empty};
use actix_multiresponse::Payload;
use dal::{System, User};
use proto::SetBeerPriceRequest;
use tracing::instrument;

#[instrument]
pub async fn set_beer_price(data: WebData, session: AdminSession, payload: Payload<SetBeerPriceRequest>) -> WebResult<Empty> {
    let user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::Unauthorized("Invalid session"))?;

    let system = System::new(data.mysql.clone())?;
    system.set_beer_price(payload.price, &user)?;

    Ok(Empty)
}
