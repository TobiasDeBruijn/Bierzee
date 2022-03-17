use actix_web::body::BoxBody;
use actix_web::http::StatusCode;
use actix_web::{HttpResponse, ResponseError};
use thiserror::Error;

pub type WebResult<T> = Result<T, Error>;

#[derive(Debug, Error)]
#[allow(unused)]
pub enum Error {
    #[error("{0}")]
    Dal(#[from] dal::Error),
    #[error("Not found: {0}")]
    NotFound(&'static str),
    #[error("Forbidden: {0}")]
    Forbidden(&'static str),
    #[error("Bad request: {0}")]
    BadRequest(&'static str),
    #[error("Unauthorized: {0}")]
    Unauthorized(&'static str),
}

impl ResponseError for Error {
    fn status_code(&self) -> StatusCode {
        match self {
            Self::Dal(_) => StatusCode::INTERNAL_SERVER_ERROR,
            Self::NotFound(_) => StatusCode::NOT_FOUND,
            Self::Forbidden(_) => StatusCode::FORBIDDEN,
            Self::BadRequest(_) => StatusCode::BAD_REQUEST,
            Self::Unauthorized(_) => StatusCode::UNAUTHORIZED,
        }
    }

    fn error_response(&self) -> HttpResponse<BoxBody> {
        let body = if self.status_code().is_client_error() {
            format!("{self}")
        } else {
            self.status_code().canonical_reason().unwrap_or("").to_string()
        };

        HttpResponse::build(self.status_code()).body(body)
    }
}
