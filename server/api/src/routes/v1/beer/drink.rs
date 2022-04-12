use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::{Empty, Session};
use actix_multiresponse::Payload;
use dal::User;
use proto::DrinkRequest;
use tracing::instrument;

#[instrument]
pub async fn drink(data: WebData, session: Session, payload: Payload<DrinkRequest>) -> WebResult<Empty> {
    let user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::Unauthorized("Invalid session"))?;

    for _ in 0..payload.beers_drunk {
        user.drink_beer(time::OffsetDateTime::now_utc().unix_timestamp())?;
    }

    Ok(Empty)
}
