use actix_multiresponse::Payload;
use dal::User;
use proto::PostAdminRequest;
use crate::appdata::WebData;
use crate::error::{Error, WebResult};
use crate::routes::Empty;
use crate::v1::organization::OrgAdmin;

pub async fn admin(data: WebData, payload: Payload<PostAdminRequest>, session: OrgAdmin) -> WebResult<Empty> {
    let user = User::get(data.mysql.clone(), &payload.user_id)?.ok_or(Error::NotFound("User not found"))?;

    if user.organization_id.ne(&session.user.organization_id) {
        return Err(Error::Forbidden("No permission for the user"));
    }

    user.set_admin(payload.is_admin)?;

    Ok(Empty)
}