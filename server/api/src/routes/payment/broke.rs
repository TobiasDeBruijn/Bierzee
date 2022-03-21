use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use dal::User;
use proto::BrokeResponse;

pub async fn broke(data: WebData, session: Session) -> WebResult<Payload<BrokeResponse>> {
    let user = User::get(data.mysql.clone(), &session.user)?.ok_or(Error::Unauthorized("Invalid session"))?;
    let payments = user.get_payments()?;
    let payments = payments
        .into_iter()
        .map(|x| proto::Payment {
            paid_at: x.paid_at,
            amount_paid: x.amount_paid,
        })
        .collect::<Vec<_>>();

    Ok(Payload(BrokeResponse { payments }))
}
