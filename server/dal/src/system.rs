use crate::user::User;
use crate::{ASql, DalResult};
use mysql::prelude::Queryable;
use mysql::{params, Params, Row, TxOpts};
use std::str::FromStr;

pub struct System {
    pool: ASql,
}

pub const SYSTEM_USER_ID: &str = "0";
const SYSTEM_USER_NAME: &str = "System";
const DEFAULT_BEER_PRICE: f64 = 0.60;

const OPTION_BEER_PRICE: &str = "beer_price";

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

        tx.commit()?;
        Ok(Self { pool })
    }

    pub fn get_total_beers_consumed(&self) -> DalResult<i64> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<usize> = conn.exec("SELECT 1 FROM beers", Params::Empty)?;
        Ok(rows.len() as i64)
    }

    pub fn get_total_amount_paid(&self) -> DalResult<f64> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec("SELECT amount_paid FROM payments", Params::Empty)?;
        let sum: f64 = rows.into_iter().map(|x| x.get::<f64, &str>("amount_paid").unwrap()).sum();

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
                "last_updated_by" => &user.name
            },
        )?;

        Ok(())
    }
}
