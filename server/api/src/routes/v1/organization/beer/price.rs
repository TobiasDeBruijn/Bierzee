use actix_multiresponse::Payload;
use dal::{Organization, SETTING_BEER_PRICE};
use proto::PostSetBeerPriceRequest;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Empty;
use crate::v1::organization::OrgAdmin;

pub async fn price(data: WebData, session: OrgAdmin, payload: Payload<PostSetBeerPriceRequest>) -> WebResult<Empty> {
    let org = Organization::get(data.mysql.clone(), &session.user.organization_id)?.ok_or(Error::NotFound("Organization not found"))?;
    let settings = org.get_settings();

    settings.set_option(SETTING_BEER_PRICE, payload.new_price, &session.user_id)?;

    Ok(Empty)
}
