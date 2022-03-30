use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use dal::{System, User};
use proto::BalanceResponse;

pub async fn balance(data: WebData, session: Session) -> WebResult<Payload<BalanceResponse>> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;

    let amount_paid: f64 = user.get_payments()?.into_iter().map(|x| x.amount_paid).sum();
    let beers_drunk = user.get_beers()?.len() as i64;

    let system = System::new(data.mysql.clone())?;
    let beer_price = system.get_beer_price()?.value;

    let total_owed = beer_price * (beers_drunk as f64);
    let balance = amount_paid - total_owed;

    // Round to 2 digits
    let balance = (balance * 100.0).round() / 100.0;
    let amount_paid = (amount_paid * 100.0).round() / 100.0;
    let beers_left = (balance / beer_price).floor() as i64;

    Ok(Payload(BalanceResponse {
        amount_paid,
        beers_drunk,
        balance,
        beers_left
    }))
}
