use crate::error::WebResult;
use crate::routes::{Empty, Session};
use tracing::instrument;

#[instrument]
pub async fn logout(session: Session) -> WebResult<Empty> {
    session.delete()?;
    Ok(Empty)
}