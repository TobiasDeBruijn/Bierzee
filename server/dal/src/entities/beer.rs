use mysql::{params, Params, Row};
use mysql::prelude::Queryable;
use crate::{ASql, DalResult};

pub const CRATE_SIZE: u32 = 24;

pub struct Beer {
    pub consumer_by: String,
    pub consumed_at: i64,
}

pub struct BeerStock;

pub struct BeerStockEntry {
    pub crates: u32,
    pub purchased_by: String,
    pub purchased_at: i64,
}
impl BeerStock {
    pub fn purchase(pool: ASql, crates: u32, amount_paid: f64, user_id: &str) -> DalResult<()> {
        let mut conn = pool.get_conn()?;
        let now = time::OffsetDateTime::now_utc().unix_timestamp();

        conn.exec_drop("INSERT INTO beer_purchases (user_id, crates, amount_paid, date) VALUES (:user_id, :crates, :amount_paid, :date)", params! {
            "user_id" => user_id,
            "crates" => crates,
            "amount_paid" => amount_paid,
            "date" => now,
        })?;
        Ok(())
    }

    pub fn list(pool: ASql) -> DalResult<Vec<BeerStockEntry>> {
        let mut conn = pool.get_conn()?;

        let rows: Vec<Row> = conn.exec("SELECT user_id,crates,date FROM beer_purchases", Params::Empty)?;
        let entries = rows.into_iter()
            .map(|x| BeerStockEntry {
                crates: x.get("crates").unwrap(),
                purchased_by: x.get("user_id").unwrap(),
                purchased_at: x.get("date").unwrap()
            })
            .collect::<Vec<_>>();
        Ok(entries)
    }
}