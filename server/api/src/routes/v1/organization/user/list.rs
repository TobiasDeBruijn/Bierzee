use actix_multiresponse::Payload;
use dal::{OptionValue, Organization, SETTING_BEER_PRICE, User};
use proto::GetListUserResponse;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::v1::organization::OrgAdmin;

pub async fn list(data: WebData, session: OrgAdmin) -> WebResult<Payload<GetListUserResponse>> {
    let org = Organization::get(data.mysql.clone(), &session.user.organization_id)?.ok_or(Error::NotFound("Organization not found"))?;
    let settings = org.get_settings();
    let beer_price: OptionValue<f64> = settings.get_option(SETTING_BEER_PRICE)?.ok_or(Error::Internal)?;

    let users = org.list_users()?.into_iter()
        .map(|x| {
            let user = User::get(data.mysql.clone(), &x)?.ok_or(Error::NotFound("User not found"))?;
            let total_beers_consumed = user.get_beers()?.len();
            let total_paid = user.get_payments()?.iter().map(|x| x.amount_paid).sum::<f64>();

            let should_have_paid = total_beers_consumed as f64 * beer_price.value;
            let delta = total_paid - should_have_paid;

            Ok(proto::UserWithBalance {
                user: Some(proto::User {
                    name: user.name,
                    id: user.id,
                    login_id: user.login_id
                }),
                balance: delta,
            })
        })
        .collect::<WebResult<Vec<_>>>()?;

    Ok(Payload(GetListUserResponse {
        users
    }))
}
