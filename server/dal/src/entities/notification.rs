use mysql::{params, Row};
use mysql::prelude::Queryable;
use rand::Rng;
use crate::{ASql, DalResult};

pub struct Notification {
    pub id: String,
    pub user_id: String,
    pub completed: bool,
    pub text: String,
    pub created_at: i64,
}

impl Notification {
    pub fn new(pool: ASql, user_id: &str, text: &str) -> DalResult<Self> {
        let id: String = rand::thread_rng().sample_iter(rand::distributions::Alphanumeric).take(32).map(char::from).collect();
        let now = time::OffsetDateTime::now_utc().unix_timestamp();

        let mut conn = pool.get_conn()?;
        conn.exec_drop("INSERT INTO notifications (id, user_id, text, created_at) VALUES (:id, :user_id, :text, :created_at)", params! {
            "id" => &id,
            "user_id" => user_id,
            "text" => text,
            "created_at" => now,
        })?;

        Ok(Self {
            id,
            user_id: user_id.to_string(),
            completed: false,
            text: text.to_string(),
            created_at: now
        })
    }

    pub fn get(pool: ASql, id: &str) -> DalResult<Option<Self>> {
        let mut conn = pool.get_conn()?;
        let row: Row = match conn.exec_first("SELECT user_id,completed,text,created_at FROM notifications WHERE id = :id", params! {
            "id" => id
        })? {
            Some(x) => x,
            None => return Ok(None)
        };

        Ok(Some(Self {
            id: id.to_string(),
            user_id: row.get("user_id").unwrap(),
            completed: row.get("completed").unwrap(),
            text: row.get("text").unwrap(),
            created_at: row.get("created_at").unwrap()
        }))
    }

    pub fn set_complete(&self, pool: ASql, completed: bool) -> DalResult<()> {
        let mut conn = pool.get_conn()?;
        conn.exec_drop("UPDATE notifications SET completed = :completed WHERE id = :id", params! {
            "completed" => completed,
            "id" => &self.id
        })?;

        Ok(())
    }

    pub fn list(pool: ASql, user_id: &str) -> DalResult<Vec<Self>> {
        let mut conn = pool.get_conn()?;
        let rows: Vec<Row> = conn.exec("SELECT id,user_id,completed,text,created_at FROM notifications WHERE user_id = :user_id", params! {
            "user_id" => user_id
        })?;

        let rows = rows.into_iter()
            .map(|x| Self {
                id: x.get("id").unwrap(),
                user_id: x.get("user_id").unwrap(),
                completed: x.get("completed").unwrap(),
                text: x.get("text").unwrap(),
                created_at: x.get("created_at").unwrap(),
            })
            .collect::<Vec<_>>();
        Ok(rows)
    }
}