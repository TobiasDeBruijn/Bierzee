use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use dal::{System, SYSTEM_USER_ID, User};
use proto::OwesResponse;

pub async fn owes(data: WebData, session: Session) -> WebResult<Payload<OwesResponse>> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    if !user.is_admin {
        return Err(Error::Forbidden("Not an administrator"));
    }

    let system = System::new(data.mysql.clone())?;
    let owning_users = system
        .get_users()?
        .into_iter()
        .map(|x| Ok((get_owed(&system, &x)?, x)))
        .collect::<WebResult<Vec<_>>>()?
        .into_iter()
        .filter(|(_, user)| user.employee_number.ne(SYSTEM_USER_ID))
        .map(|(balance, user)| proto::OwningUser {
            employee_id: user.employee_number,
            name: user.name,
            is_admin: user.is_admin,
            amount_owed: balance,
        })
        .collect::<Vec<_>>();

    Ok(Payload(OwesResponse { owning_users }))
}

fn get_owed(system: &System, user: &User) -> WebResult<f64> {
    let amount_paid: f64 = user.get_payments()?.into_iter().map(|x| x.amount_paid).sum();
    let beers_drunk = user.get_beers()?.len() as i64;

    let beer_price = system.get_beer_price()?.value;

    let total_owed = beer_price * (beers_drunk as f64);
    let balance = amount_paid - total_owed;

    Ok(balance)
}
