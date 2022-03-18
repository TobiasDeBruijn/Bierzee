use crate::beer::Beer;
use crate::payment::Payment;
use crate::session::UserSession;
use crate::{ASql, DalResult};
use mysql::prelude::Queryable;
use mysql::{params, Row};

pub struct User {
    pool: ASql,
    pub employee_number: String,
    pub name: String,
    pub is_admin: bool,
}

pub struct UserBuildable {
    pub employee_number: String,
    pub name: String,
}

impl User {
    pub fn get(pool: ASql, employee_number: &str) -> DalResult<Option<Self>> {
        let mut conn = pool.get_conn()?;
        let row: Row = match conn.exec_first(
            "SELECT name,is_admin FROM users WHERE id = :id",
            params! {
                "id" => employee_number
            },
        )? {
            Some(x) => x,
            None => return Ok(None),
        };

        Ok(Some(Self {
            pool,
            employee_number: employee_number.to_string(),
            name: row.get("name").unwrap(),
            is_admin: row.get("is_admin").unwrap(),
        }))
    }

    pub fn create(pool: ASql, buildable: UserBuildable) -> DalResult<Self> {
        let mut conn = pool.get_conn()?;
        conn.exec_drop(
            "INSERT INTO users (id,name) VALUES (:id, :name)",
            params! {
                "id" => &buildable.employee_number,
                "name" => &buildable.name
            },
        )?;

        Ok(Self {
            pool,
            employee_number: buildable.employee_number,
            name: buildable.name,
            is_admin: false,
        })
    }

    pub fn get_beers(&self) -> DalResult<Vec<Beer>> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec(
            "SELECT consumed_at FROM beers WHERE user_id = :user_id",
            params! {
                "user_id" => &self.employee_number
            },
        )?;
        let beers = rows
            .into_iter()
            .map(|x| Beer {
                consumer_by: self.employee_number.clone(),
                consumed_at: x.get("consumed_at").unwrap(),
            })
            .collect::<Vec<_>>();
        Ok(beers)
    }

    pub fn drink_beer(&self, consumed_at: i64) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        conn.exec_drop(
            "INSERT INTO beers (user_id, consumed_at) VALUES (:user_id, :consumed_at)",
            params! {
                "user_id" => &self.employee_number,
                "consumed_at" => consumed_at
            },
        )?;
        Ok(())
    }

    pub fn get_payments(&self) -> DalResult<Vec<Payment>> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec(
            "SELECT paid_at,amount_paid FROM payments WHERE user_id = :user_id",
            params! {
                "user_id" => &self.employee_number
            },
        )?;
        let payments = rows
            .into_iter()
            .map(|x| Payment {
                paid_by: self.employee_number.clone(),
                paid_at: x.get("paid_at").unwrap(),
                amount_paid: x.get("amount_paid").unwrap(),
            })
            .collect::<Vec<_>>();
        Ok(payments)
    }

    pub fn pay(&self, paid_at: i64, amount: f64) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        conn.exec_drop(
            "INSERT INTO payments (user_id, paid_at, amount_paid) VALUES (:user_id, :paid_at, :amount_paid)",
            params! {
                "user_id" => &self.employee_number,
                "paid_at" => paid_at,
                "amount_paid" => amount
            },
        )?;
        Ok(())
    }

    pub fn create_session(&self) -> DalResult<UserSession> {
        UserSession::create(self.pool.clone(), self)
    }

    pub fn set_admin(&self, admin: bool) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        conn.exec_drop(
            "UPDATE users SET is_admin = :is_admin WHERE id = :id",
            params! {
                "is_admin" => admin,
                "id" => &self.employee_number
            },
        )?;
        Ok(())
    }
}
