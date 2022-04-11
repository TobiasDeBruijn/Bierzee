use mysql::prelude::Queryable;
use mysql::{params, Params, Row};
use crate::{ASql, DalResult};

#[derive(PartialEq)]
pub enum PaymentDeniedStatus {
    Denied(String),
    None,
}

impl PaymentDeniedStatus {
    pub fn new(denied: bool, by: Option<String>) -> Self {
        if denied {
            Self::Denied(by.unwrap())
        } else {
            Self::None
        }
    }
}

pub struct Payment {
    pub payment_id: String,
    pub paid_by: String,
    pub paid_at: i64,
    pub amount_paid: f64,
    pub denied: PaymentDeniedStatus,
}

impl From<mysql::Row> for Payment {
    fn from(row: Row) -> Self {
        let denied: bool = row.get("denied").unwrap();
        let denied_by: Option<String> = row.get("denied_by").unwrap();

        Self {
            payment_id: row.get("payment_id").unwrap(),
            paid_by: row.get("user_id").unwrap(),
            paid_at: row.get("paid_at").unwrap(),
            amount_paid: row.get("amount_paid").unwrap(),
            denied: PaymentDeniedStatus::new(denied, denied_by),
        }
    }
}

impl Payment {
    pub fn get_by_id(pool: ASql, payment_id: &str) -> DalResult<Option<Self>> {
        let mut conn = pool.get_conn()?;
        let row: Row = match conn.exec_first("SELECT payment_id,user_id,paid_at,amount_paid,denied,denied_by FROM payments WHERE payment_id = :payment_id", params! {
            "payment_id" => payment_id
        })? {
            Some(x) => x,
            None => return Ok(None)
        };

        Ok(Some(Self::from(row)))
    }

    pub fn list(pool: ASql, organization_id: &str) -> DalResult<Vec<Self>> {
        let mut conn = pool.get_conn()?;
        let rows: Vec<Row> = conn.exec("SELECT payment_id,user_id,paid_at,amount_paid,denied,denied_by FROM payments WHERE organization_id = :organization_id", params! {
            "organization_id" => organization_id,
        })?;
        let payments = rows.into_iter()
            .map(Self::from)
            .collect::<Vec<_>>();
        Ok(payments)
    }

    pub fn set_denied(&self, pool: ASql, denied: bool, denied_by: Option<&str>) -> DalResult<()> {
        let mut conn = pool.get_conn()?;
        conn.exec_drop("UPDATE payments SET denied = :denied, denied_by = :denied_by WHERE payment_id = :payment_id", params! {
            "denied" => denied,
            "denied_by" => denied_by.map(|x| x.to_string()),
            "payment_id" => &self.payment_id,
        })?;
        Ok(())
    }
}
