use crate::error::WebResult;
use crate::routes::{Empty, Session};

pub async fn logout(session: Session) -> WebResult<Empty> {
    session.delete()?;
    Ok(Empty)
}