use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use dal::User;
use proto::DrunkResponse;
use tracing::instrument;

#[instrument]
pub async fn drunk(data: WebData, session: Session) -> WebResult<Payload<DrunkResponse>> {
    let user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::Unauthorized("Invalid session"))?;
    let beers = user.get_beers()?;

    let beers = beers.into_iter().map(|x| proto::Beer { drunk_at: x.consumed_at }).collect::<Vec<_>>();

    Ok(Payload(DrunkResponse { beers }))
}
