use actix_multiresponse::Payload;
use dal::{Beer, BeerStock, User};
use proto::GetBeerStockResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::v1::organization::OrgAdmin;

const CRATE_SIZE: u64 = 24;

pub async fn stock(data: WebData, session: OrgAdmin) -> WebResult<Payload<GetBeerStockResponse>> {
    let stock = BeerStock::list(data.mysql.clone(), &session.user.organization_id)?;
    let stock = stock.into_iter()
        .map(|x| {
            let purchased_by = User::get(data.mysql.clone(), &x.purchased_by)?.ok_or(Error::NotFound("User not found"))?;

            Ok(proto::BeerStockEntry {
                purchased_by: Some(proto::User {
                    name: purchased_by.name,
                    id: purchased_by.id,
                    login_id: purchased_by.login_id
                }),
                purchased_at: x.purchased_at,
                crates_aquired: x.crates
            })
        })
        .collect::<WebResult<Vec<_>>>()?;

    let total_crates_purchased: u64 = stock.iter().map(|x| x.crates_aquired as u64).sum();
    let total_beers_purchased = total_crates_purchased * CRATE_SIZE;

    let total_consumed = Beer::list(data.mysql.clone(), &session.user.organization_id)?.len() as u64;
    let beers_left = total_beers_purchased as i64 - total_consumed as i64;

    Ok(Payload(GetBeerStockResponse {
        beer_stock_entries: stock,
        bottles_left: beers_left
    }))
}