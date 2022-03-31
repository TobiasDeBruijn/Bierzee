use actix_multiresponse::Payload;
use dal::{BeerStock, CRATE_SIZE, System, User};
use proto::GetBeerStockResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::AdminSession;

pub async fn stock(data: WebData, _: AdminSession) -> WebResult<Payload<GetBeerStockResponse>> {
    let stock = BeerStock::list(data.mysql.clone())?;
    let stock = stock.into_iter()
        .map(|x| {
            let user = User::get(data.mysql.clone(), &x.purchased_by)?.ok_or(Error::NotFound("User not found"))?;

            Ok(proto::BeerStockEntry {
                crates: x.crates,
                purchased_by: Some(proto::User {
                    name: user.name,
                    employee_id: user.employee_number
                }),
                purchased_at: x.purchased_at
            })
        })
        .collect::<WebResult<Vec<_>>>()?;

    let total_crates_purchased: u64 = stock.iter().map(|x| x.crates as u64).sum();
    let total_beers_purchased = total_crates_purchased * CRATE_SIZE as u64;

    let system = System::new(data.mysql.clone())?;
    let total_beers_consumed = system.get_total_beers_consumed()?;
    let total_paid = system.get_total_amount_paid()?;
    let beer_price = system.get_beer_price()?.value;

    let beers_left = total_beers_purchased as i64 - total_beers_consumed;

    let should_be_paid = beer_price * total_beers_consumed as f64;
    let total_balance = total_paid - should_be_paid;

    Ok(Payload(GetBeerStockResponse {
        stock_entries: stock,
        bottles_left: beers_left,
        payment_balance: total_balance,
    }))
}