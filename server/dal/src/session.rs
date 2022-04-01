use crate::user::User;
use crate::{ASql, DalResult};
use mysql::prelude::Queryable;
use mysql::{params, Row};
use rand::Rng;

const SESSION_ID_LENGTH: usize = 32;
const SESSION_EXPIRY_SECS: i64 = 2_592_000; // 30 days;

#[derive(Debug)]
pub struct UserSession {
    pool: ASql,
    pub id: String,
    pub user: String,
    pub expires_at: i64,
}

impl UserSession {
    pub fn get_by_id(pool: ASql, id: &str) -> DalResult<Option<Self>> {
        let mut conn = pool.get_conn()?;
        let row: Row = match conn.exec_first(
            "SELECT user_id,expires_at FROM sessions WHERE id = :id",
            params! {
                "id" => id
            },
        )? {
            Some(x) => x,
            None => return Ok(None),
        };

        Ok(Some(UserSession {
            pool,
            id: id.to_string(),
            user: row.get("user_id").unwrap(),
            expires_at: row.get("expires_at").unwrap(),
        }))
    }

    pub fn create(pool: ASql, user: &User) -> DalResult<Self> {
        let mut conn = pool.get_conn()?;

        let id: String = rand::thread_rng()
            .sample_iter(rand::distributions::Alphanumeric)
            .take(SESSION_ID_LENGTH)
            .map(char::from)
            .collect();
        let expires_at = time::OffsetDateTime::now_utc().unix_timestamp() + SESSION_EXPIRY_SECS;

        conn.exec_drop(
            "INSERT INTO sessions (id, user_id, expires_at) VALUES (:id, :user_id, :expires_at)",
            params! {
                "id" => &id,
                "user_id" => &user.employee_number,
                "expires_at" => expires_at
            },
        )?;

        Ok(Self {
            pool,
            id,
            user: user.employee_number.clone(),
            expires_at,
        })
    }

    pub fn delete(&self) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        conn.exec_drop(
            "DELETE FROM sessions WHERE id = :id",
            params! {
                "id" => &self.id
            },
        )?;
        Ok(())
    }
}
