use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};
use actix_multiresponse::Payload;
use dal::{System, User};
use proto::SetBeerPriceRequest;

pub async fn set_beer_price(data: WebData, session: Session, payload: Payload<SetBeerPriceRequest>) -> WebResult<Empty> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    if !user.is_admin {
        return Err(Error::Forbidden("Not an administrator"));
    }

    let system = System::new(data.mysql.clone())?;
    system.set_beer_price(payload.price, &user)?;

    Ok(Empty)
}
