use crate::entities::user::User;
use crate::{ASql, DalResult};
use mysql::prelude::Queryable;
use mysql::{params, Params, Row, Transaction, TxOpts};
use std::str::FromStr;

pub struct System {
    pool: ASql,
}

pub const SYSTEM_USER_ID: &str = "0";
const SYSTEM_USER_NAME: &str = "System";
const DEFAULT_BEER_PRICE: f64 = 0.60;

pub const GOOGLE_PLAY_USER_ID: &str = "GooglePlay";
pub const APPLE_USER_ID: &str = "AppleDeveloper";

const OPTION_BEER_PRICE: &str = "beer_price";
const OPTION_GLOBAL_PASSWORD: &str = "global_password";

pub struct OptionValue<T> {
    pub value: T,
    pub last_updated: i64,
    pub last_updated_by: String,
}

impl System {
    pub fn new(pool: ASql) -> DalResult<Self> {
        let mut tx = pool.start_transaction(TxOpts::default())?;
        tx.exec_drop(
            "INSERT IGNORE INTO users (id, name, is_admin) VALUES (:id, :name, true)",
            params! {
                "id" => SYSTEM_USER_ID,
                "name" => SYSTEM_USER_NAME,
            },
        )?;
        tx.exec_drop(
            "INSERT IGNORE INTO system (name, value, last_updated, last_updated_by) VALUES (:name, :value, :last_updated, :last_updated_by)",
            params! {
                "name" => OPTION_BEER_PRICE,
                "value" => DEFAULT_BEER_PRICE,
                "last_updated" => time::OffsetDateTime::now_utc().unix_timestamp(),
                "last_updated_by" => SYSTEM_USER_ID
            },
        )?;

        Self::set_default_option(&mut tx, OPTION_GLOBAL_PASSWORD, "pancakes")?;

        tx.commit()?;
        Ok(Self { pool })
    }

    fn set_default_option(tx: &mut Transaction, name: &str, value: &str) -> DalResult<()> {
        tx.exec_drop(
            "INSERT IGNORE INTO system (name, value, last_updated, last_updated_by) VALUES (:name, :value, :last_updated, :last_updated_by)",
            params! {
                "name" => name,
                "value" => value,
                "last_updated" => time::OffsetDateTime::now_utc().unix_timestamp(),
                "last_updated_by" => SYSTEM_USER_ID,
            },
        )?;

        Ok(())
    }

    pub fn set_global_password(&self, global_password: &str, user: &User) -> DalResult<()> {
        self.set_option(OPTION_GLOBAL_PASSWORD, global_password, user)
    }

    pub fn get_global_password(&self) -> DalResult<OptionValue<String>> {
        Ok(self.get_option(OPTION_GLOBAL_PASSWORD)?.unwrap())
    }

    pub fn get_total_beers_consumed(&self) -> DalResult<i64> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec("SELECT user_id FROM beers", Params::Empty)?;
        let rows = rows.into_iter()
            .filter(|x| {
                let user_id: String = x.get("user_id").unwrap();
                user_id.ne(SYSTEM_USER_ID) && user_id.ne(GOOGLE_PLAY_USER_ID) && user_id.ne(APPLE_USER_ID)
            })
            .collect::<Vec<_>>();

        Ok(rows.len() as i64)
    }

    pub fn get_total_amount_paid(&self) -> DalResult<f64> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec("SELECT amount_paid,user_id FROM payments", Params::Empty)?;
        let sum: f64 = rows.into_iter()
            .filter(|x| {
                let user_id: String = x.get("user_id").unwrap();
                user_id.ne(SYSTEM_USER_ID) && user_id.ne(GOOGLE_PLAY_USER_ID) && user_id.ne(APPLE_USER_ID)
            })
            .map(|x| x.get::<f64, &str>("amount_paid").unwrap()).sum();

        Ok(sum)
    }

    pub fn get_users(&self) -> DalResult<Vec<User>> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec("SELECT id FROM users", Params::Empty)?;
        rows.into_iter()
            .map(|x| x.get::<String, &str>("id").unwrap())
            .map(|x| Ok(User::get(self.pool.clone(), &x)?.unwrap()))
            .collect::<DalResult<Vec<_>>>()
    }

    pub fn get_beer_price(&self) -> DalResult<OptionValue<f64>> {
        let value = self.get_option(OPTION_BEER_PRICE)?.unwrap();
        let value = OptionValue {
            value: f64::from_str(&value.value)?,
            last_updated: value.last_updated,
            last_updated_by: value.last_updated_by,
        };
        Ok(value)
    }

    pub fn set_beer_price(&self, price: f64, user: &User) -> DalResult<()> {
        self.set_option(OPTION_BEER_PRICE, &price.to_string(), user)
    }

    fn get_option(&self, name: &str) -> DalResult<Option<OptionValue<String>>> {
        let mut conn = self.pool.get_conn()?;
        let row: Row = match conn.exec_first(
            "SELECT value,last_updated,last_updated_by FROM system WHERE name = :name",
            params! {
                "name" => name
            },
        )? {
            Some(x) => x,
            None => return Ok(None),
        };

        let value: String = row.get("value").unwrap();
        let last_updated: i64 = row.get("last_updated").unwrap();
        let last_updated_by: String = row.get("last_updated_by").unwrap();

        Ok(Some(OptionValue {
            value,
            last_updated,
            last_updated_by,
        }))
    }

    fn set_option(&self, name: &str, value: &str, user: &User) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        conn.exec_drop(
            "UPDATE system SET value = :value, last_updated = :last_updated, last_updated_by = :last_updated_by WHERE name = :name",
            params! {
                "name" => name,
                "value" => value,
                "last_updated" => time::OffsetDateTime::now_utc().unix_timestamp(),
                "last_updated_by" => &user.id
            },
        )?;

        Ok(())
    }
}
