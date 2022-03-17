mod _mysql;
mod beer;
mod payment;
mod session;
mod system;
mod user;

pub use _mysql::*;
pub use beer::*;
pub use payment::*;
pub use session::*;
pub use system::*;
pub use user::*;

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
}
