use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use dal::{OptionValue, Organization, PaymentDeniedStatus, SETTING_BEER_PRICE};
use proto::GetBalanceResponse;
use tracing::instrument;

#[instrument]
pub async fn balance(data: WebData, session: Session) -> WebResult<Payload<GetBalanceResponse>> {
    let amount_paid: f64 = session.user.get_payments()?.into_iter()
        .filter(|x| match x.denied {
            PaymentDeniedStatus::Denied(_) => false,
            _ => true
        })
        .map(|x| x.amount_paid).sum();
    let beers_drunk = session.user.get_beers()?.len() as i64;

    let org = Organization::get(data.mysql.clone(), &session.user.organization_id)?.ok_or(Error::NotFound("Organization not found"))?;
    let settings = org.get_settings();
    let beer_price: OptionValue<f64> = settings.get_option(SETTING_BEER_PRICE)?.ok_or(Error::Internal)?;

    let total_owed = beer_price.value * (beers_drunk as f64);
    let balance = amount_paid - total_owed;

    // Round to 2 digits
    let balance = (balance * 100.0).round() / 100.0;
    let amount_paid = (amount_paid * 100.0).round() / 100.0;
    let beers_left = (balance / beer_price.value).floor() as i64;

    Ok(Payload(GetBalanceResponse {
        amount_paid,
        beers_drunk,
        balance,
        beers_left
    }))
}
