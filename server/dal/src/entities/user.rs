use crate::entities::beer::Beer;
use crate::entities::payment::Payment;
use crate::entities::session::UserSession;
use crate::{ASql, DalResult, PaymentDeniedStatus};
use mysql::prelude::Queryable;
use mysql::{params, Row};
use rand::Rng;

#[derive(Debug, Clone)]
pub struct User {
    pool: ASql,
    pub id: String,
    pub login_id: String,
    pub organization_id: String,
    pub name: String,
    pub is_admin: bool,
}

pub struct UserBuildable {
    pub login_id: String,
    pub organization_id: String,
    pub name: String,
}

impl User {
    fn system_user(pool: ASql) -> Self {
        Self {
            pool,
            organization_id: "SYSTEM".to_string(),
            name: "SYSTEM".to_string(),
            login_id: "SYSTEM".to_string(),
            id: "SYSTEM".to_string(),
            is_admin: false,
        }
    }

    pub fn get(pool: ASql, id: &str) -> DalResult<Option<Self>> {
        if id.eq("SYSTEM") {
            return Ok(Some(Self::system_user(pool)));
        }

        let mut conn = pool.get_conn()?;
        let row: Row = match conn.exec_first(
            "SELECT login_id,organization_id,name,is_admin FROM users WHERE id = :id",
            params! {
                "id" => id
            },
        )? {
            Some(x) => x,
            None => return Ok(None),
        };

        Ok(Some(Self {
            pool,
            id: id.to_string(),
            login_id: row.get("login_id").unwrap(),
            name: row.get("name").unwrap(),
            organization_id: row.get("organization_id").unwrap(),
            is_admin: row.get("is_admin").unwrap(),
        }))
    }

    pub fn get_by_login_id(pool: ASql, login_id: &str) -> DalResult<Option<Self>> {
        let mut conn = pool.get_conn()?;
        let row: Row = match conn.exec_first(
            "SELECT id,name,organization_id,is_admin FROM users WHERE login_id = :login_id",
            params! {
                "login_id" => login_id
            },
        )? {
            Some(x) => x,
            None => return Ok(None),
        };

        Ok(Some(Self {
            pool,
            id: row.get("id").unwrap(),
            login_id: login_id.to_string(),
            name: row.get("name").unwrap(),
            organization_id: row.get("organization_id").unwrap(),
            is_admin: row.get("is_admin").unwrap(),
        }))
    }

    pub fn create(pool: ASql, buildable: UserBuildable) -> DalResult<Self> {
        let mut conn = pool.get_conn()?;
        let id: String = rand::thread_rng().sample_iter(rand::distributions::Alphanumeric).take(64).map(char::from).collect();

        conn.exec_drop(
            "INSERT INTO users (id,login_id,name,organization_id) VALUES (:id, :login_id, :name, :organization_id)",
            params! {
                "id" => &id,
                "login_id" => &buildable.login_id,
                "organization_id" => &buildable.organization_id,
                "name" => &buildable.name
            },
        )?;

        Ok(Self {
            pool,
            id,
            login_id: buildable.login_id,
            name: buildable.name,
            organization_id: buildable.organization_id,
            is_admin: false,
        })
    }

    pub fn get_beers(&self) -> DalResult<Vec<Beer>> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec(
            "SELECT user_id,id,consumed_at,organization_id FROM beers WHERE user_id = :user_id",
            params! {
                "user_id" => &self.id
            },
        )?;
        let beers = rows
            .into_iter()
            .map(|x| Beer {
                id: x.get("id").unwrap(),
                organization_id: x.get("organization_id").unwrap(),
                consumed_at: x.get("consumed_at").unwrap(),
                consumed_by: x.get("user_id").unwrap(),
            })
            .collect::<Vec<_>>();
        Ok(beers)
    }

    pub fn drink_beer(&self, consumed_at: i64) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        conn.exec_drop(
            "INSERT INTO beers (user_id, consumed_at, organization_id) VALUES (:user_id, :consumed_at, :organization_id)",
            params! {
                "user_id" => &self.id,
                "consumed_at" => consumed_at,
                "organization_id" => &self.organization_id,
            },
        )?;
        Ok(())
    }

    pub fn get_payments(&self) -> DalResult<Vec<Payment>> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec(
            "SELECT organization_id,payment_id,paid_at,amount_paid,denied,denied_by FROM payments WHERE user_id = :user_id",
            params! {
                "user_id" => &self.id
            },
        )?;
        let payments = rows
            .into_iter()
            .map(|x| {
                let denied: bool = x.get("denied").unwrap();
                let denied_by: Option<String> = x.get("denied_by").unwrap();
                Payment {
                    organization_id: x.get("organization_id").unwrap(),
                    payment_id: x.get("payment_id").unwrap(),
                    paid_by: self.id.clone(),
                    paid_at: x.get("paid_at").unwrap(),
                    amount_paid: x.get("amount_paid").unwrap(),
                    denied: PaymentDeniedStatus::new(denied, denied_by)
                }
            })
            .collect::<Vec<_>>();
        Ok(payments)
    }

    pub fn pay(&self, paid_at: i64, amount: f64) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        let payment_id: String = rand::thread_rng().sample_iter(rand::distributions::Alphanumeric).take(32).map(char::from).collect();
        conn.exec_drop(
            "INSERT INTO payments (payment_id, user_id, paid_at, amount_paid, organization_id) VALUES (:payment_id, :user_id, :paid_at, :amount_paid, :organization_id)",
            params! {
                "payment_id" => &payment_id,
                "user_id" => &self.id,
                "paid_at" => paid_at,
                "amount_paid" => amount,
                "organization_id" => &self.organization_id,
            },
        )?;
        Ok(())
    }

    pub fn create_session(&self) -> DalResult<UserSession> {
        UserSession::create(self.pool.clone(), self.clone())
    }

    pub fn set_admin(&self, admin: bool) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        conn.exec_drop(
            "UPDATE users SET is_admin = :is_admin WHERE id = :id",
            params! {
                "is_admin" => admin,
                "id" => &self.id
            },
        )?;
        Ok(())
    }
}
