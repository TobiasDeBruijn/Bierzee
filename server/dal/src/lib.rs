mod _mysql;
mod entities;
mod hashing;

pub use entities::*;
pub use _mysql::*;

use thiserror::Error;

type DalResult<T> = std::result::Result<T, Error>;

#[derive(Debug, Error)]
pub enum Error {
    #[error("{0}")]
    Mysql(#[from] mysql::Error),
    #[error("{0}")]
    Refinery(#[from] refinery::Error),
    #[error("{0}")]
    ParseFloat(#[from] std::num::ParseFloatError),
    #[error("{0}")]
    Bcrypt(#[from] bcrypt::BcryptError),
    #[error("Not Found")]
    NotFound
}
