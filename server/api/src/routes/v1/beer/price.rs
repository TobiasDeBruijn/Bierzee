use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use dal::{Organization, SETTING_BEER_PRICE, User};
use proto::GetBeerPriceResponse;
use tracing::instrument;

#[instrument]
pub async fn price(data: WebData, session: Session) -> WebResult<Payload<GetBeerPriceResponse>> {
    let organization = Organization::get(data.mysql.clone(), &session.user.organization_id)?.ok_or(Error::NotFound("Organization not found"))?;
    let settings = organization.get_settings();
    let price = settings.get_option(SETTING_BEER_PRICE)?.ok_or(Error::Internal)?;

    let updated_by = User::get(data.mysql.clone(), &price.last_updated_by)?.ok_or(Error::Internal)?;

    Ok(Payload(GetBeerPriceResponse {
        last_updated: price.last_updated_at,
        price: price.value,
        last_changed_by: Some(proto::User {
            login_id: updated_by.login_id,
            id: updated_by.id,
            name: updated_by.name,
        })
    }))
}
