use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Session;
use actix_multiresponse::Payload;
use dal::{PaymentDeniedStatus, User};
use proto::GetListPaymentsResponse;
use tracing::instrument;

#[instrument]
pub async fn list(data: WebData, session: Session) -> WebResult<Payload<GetListPaymentsResponse>> {
    let user = User::get(data.mysql.clone(), &session.user_id)?.ok_or(Error::Unauthorized("Invalid session"))?;
    let payments = user.get_payments()?;
    let payments = payments
        .into_iter()
        .filter(|x| x.denied.eq(&PaymentDeniedStatus::None))
        .map(|x| {
            let denied_by = match x.denied {
                PaymentDeniedStatus::Denied(user_id) => {
                    let denied_by = User::get(data.mysql.clone(), &user_id)?.ok_or(Error::NotFound("Could not find user who denied payment"))?;
                    Some(proto::User {
                        id: denied_by.id,
                        name: denied_by.name,
                        login_id: denied_by.login_id,
                    })
                },
                PaymentDeniedStatus::None => None,
            };

            let paid_by_user = User::get(data.mysql.clone(), &x.paid_by)?.ok_or(Error::NotFound("User not found"))?;

            Ok(proto::Payment {
                paid_at: x.paid_at,
                amount: x.amount_paid,
                denied: denied_by.is_some(),
                user: Some(proto::User {
                    id: paid_by_user.id,
                    name: paid_by_user.name,
                    login_id: paid_by_user.login_id,
                }),
                denied_by,
                id: x.payment_id,
            })
        })
        .collect::<Result<Vec<_>, Error>>()?;

    Ok(Payload(GetListPaymentsResponse { payments }))
}
