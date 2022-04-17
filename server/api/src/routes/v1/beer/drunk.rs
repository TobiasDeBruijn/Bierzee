use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use dal::User;
use proto::GetDrunkResponse;
use tracing::instrument;

#[instrument]
pub async fn drunk(data: WebData, session: Session) -> WebResult<Payload<GetDrunkResponse>> {
    let user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::Unauthorized("Invalid session"))?;
    let beers = user.get_beers()?;

    let beers = beers.into_iter().map(|x| proto::Beer {
        consumed_by: Some(proto::User {
            name: user.name.clone(),
            id: user.id.clone(),
            login_id: user.login_id.clone(),
        }),
        consumed_at: x.consumed_at
    }).collect::<Vec<_>>();

    Ok(Payload(GetDrunkResponse { beers }))
}
