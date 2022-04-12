use actix_multiresponse::Payload;
use dal::{Beer, User};
use proto::GetListBeerResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::v1::organization::OrgAdmin;

pub async fn list(data: WebData, session: OrgAdmin) -> WebResult<Payload<GetListBeerResponse>> {
    let beers = Beer::list(data.mysql.clone(), &session.user.organization_id)?;
    let beers = beers.into_iter()
        .map(|x| {
            let user = User::get(data.mysql.clone(), &x.consumed_by)?.ok_or(Error::NotFound("User not found"))?;
            Ok(proto::Beer {
                consumed_by: Some(proto::User {
                    id: user.id,
                    login_id: user.login_id,
                    name: user.name
                }),
                consumed_at: x.consumed_at
            })
        })
        .collect::<WebResult<Vec<_>>>()?;

    Ok(Payload(GetListBeerResponse {
        beers
    }))
}
