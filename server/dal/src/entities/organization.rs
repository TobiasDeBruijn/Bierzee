use std::fmt::Debug;
use std::str::FromStr;
use mysql::prelude::Queryable;
use mysql::{params, Params, Row};
use rand::Rng;
use tracing::debug;
use crate::{ASql, DalResult};
use crate::hashing::hash;

pub const SETTING_BEER_PRICE: &str = "beer_price";

pub struct Organization {
    pool: ASql,
    pub id: String,
    pub name: String,
    pub hash: String,
    pub code: String,
    pub created_at: i64,
}

pub struct OrganizationBuildable {
    pub name: String,
    pub password: String,
}

impl Organization {
    fn system_organization(pool: ASql) -> Self {
        Self {
            pool,
            id: "SYSTEM".to_string(),
            hash: "".to_string(),
            created_at: 0,
            name: "SYSTEM".to_string(),
            code: "SYSTEM".to_string(),
        }
    }

    pub fn get_by_code(pool: ASql, code: &str) -> DalResult<Option<Self>> {
        if code.eq("SYSTEM") {
            return Ok(Some(Self::system_organization(pool)));
        }

        let mut conn = pool.get_conn()?;
        let row: Row = match conn.exec_first("SELECT id,name,hash,created_at FROM organizations WHERE code = :code", params! {
            "code" => code,
        })? {
            Some(x) => x,
            None => return Ok(None)
        };

        Ok(Some(Self {
            pool,
            id: row.get("id").unwrap(),
            name: row.get("name").unwrap(),
            hash: row.get("hash").unwrap(),
            code: code.to_string(),
            created_at: row.get("created_at").unwrap(),
        }))
    }

    pub fn get(pool: ASql, id: &str) -> DalResult<Option<Self>> {
        if id.eq("SYSTEM") {
            return Ok(Some(Self::system_organization(pool)));
        }

        let mut conn = pool.get_conn()?;
        let row: Row = match conn.exec_first("SELECT name,hash,code,created_at FROM organizations WHERE id = :id", params! {
            "id" => id
        })? {
            Some(x) => x,
            None => return Ok(None)
        };

        Ok(Some(Self {
            pool,
            id: id.to_string(),
            name: row.get("name").unwrap(),
            hash: row.get("hash").unwrap(),
            code: row.get("code").unwrap(),
            created_at: row.get("created_at").unwrap(),
        }))
    }

    pub fn create(pool: ASql, buildable: OrganizationBuildable, pepper: &str) -> DalResult<Self> {
        let id: String = rand::thread_rng().sample_iter(rand::distributions::Alphanumeric).take(64).map(char::from).collect();
        let now = time::OffsetDateTime::now_utc().unix_timestamp();

        let salt: String = rand::thread_rng().sample_iter(rand::distributions::Alphanumeric).take(16).map(char::from).collect();
        let hash = hash(&buildable.password, &salt, pepper)?;

        let code_u16: u16 = rand::thread_rng().gen();
        let mut code = code_u16.to_string();

        if code.len() > 6 {
            let _ = code.drain(6..);
        } else {
            let shift = 6 - code.len();
            let shifted = code_u16 << shift;
            code = shifted.to_string();
        }

        debug!("code: {}", code);

        let mut conn = pool.get_conn()?;
        conn.exec_drop("INSERT INTO organizations (id, name, hash, created_at, code) VALUES (:id, :name, :hash, :created_at, :code)", params! {
            "id" => &id,
            "name" => &buildable.name,
            "hash" => &hash,
            "code" => &code,
            "created_at" => now
        })?;

        let this = Self {
            pool,
            id,
            name: buildable.name,
            hash,
            code,
            created_at: now
        };

        let settings = this.get_settings();
        settings.set_option(SETTING_BEER_PRICE, 0.60f64, "SYSTEM")?;

        Ok(this)
    }

    pub fn verify_password(&self, password: &str, pepper: &str) -> DalResult<bool> {
        Ok(crate::hashing::verify(&self.hash, password, pepper)?)
    }

    pub fn get_settings(&self) -> OrganizationSettings<'_> {
        OrganizationSettings {
            id: &self.id,
            pool: self.pool.clone(),
        }
    }

    pub fn list_users(&self) -> DalResult<Vec<String>> {
        let mut conn = self.pool.get_conn()?;
        let rows: Vec<Row> = conn.exec("SELECT id FROM users WHERE organization_id = :organization_id", params! {
            "organization_id" => &self.id
        })?;

        let ids = rows.into_iter()
            .map(|x| x.get("id").unwrap())
            .collect::<Vec<_>>();

        Ok(ids)
    }
}

pub struct OrganizationSettings<'a> {
    pool: ASql,
    id: &'a str,
}

pub struct OptionValue<T> {
    pub value: T,
    pub last_updated_by: String,
    pub last_updated_at: i64,
}

pub trait FromString<T> {
    fn from_string(x: String) -> T;
}

impl<T> FromString<T> for T
    where
        T: FromStr,
        T: Debug,
        <T as FromStr>::Err: Debug,
{
    fn from_string(x: String) -> T {
        T::from_str(&x).unwrap()
    }
}

impl<'a> OrganizationSettings<'a> {
    pub fn get_option<T: FromString<T>>(&self, key: &str) -> DalResult<Option<OptionValue<T>>> {
        let mut conn = self.pool.get_conn()?;
        let row: Row = match conn.exec_first("SELECT value,last_changed_by,last_changed_at FROM organization_settings WHERE organization_id = :organization_id AND name = :key", params! {
            "organization_id" => self.id,
            "key" => key
        })? {
            Some(x) => x,
            None => return Ok(None)
        };

        let value: String = row.get("value").unwrap();
        let last_updated_by: String = row.get("last_changed_by").unwrap();
        let last_updated_at: i64 = row.get("last_changed_at").unwrap();

        Ok(Some(OptionValue {
            value: T::from_string(value),
            last_updated_by,
            last_updated_at
        }))
    }

    pub fn set_option<T: ToString>(&self, key: &str, value: T, user: &str) -> DalResult<()> {
        let mut conn = self.pool.get_conn()?;
        let option_exists = conn.exec_first::<usize, &str, Params>("SELECT 1 FROM organization_settings WHERE organization_id = :organization_id AND name = :key", params! {
            "organization_id" => self.id,
            "key" => key
        })?.is_some();

        let value = value.to_string();
        if option_exists {
            conn.exec_drop("UPDATE organization_settings SET value = :value, last_changed_by = :last_changed_by, last_changed_at = :last_changed_at WHERE organization_id = :organization_id AND name = :name", params! {
                "organization_id" => self.id,
                "name" => key,
                "value" => value,
                "last_changed_by" => user,
                "last_changed_at" => time::OffsetDateTime::now_utc().unix_timestamp(),
            })?;
        } else {
            conn.exec_drop("INSERT INTO organization_settings (organization_id, name, value, last_changed_by, last_changed_at) VALUES (:organization_id, :name, :value, :last_changed_by, :last_changed_at)", params! {
                "organization_id" => self.id,
                "name" => key,
                "value" => value,
                "last_changed_by" => user,
                "last_changed_at" => time::OffsetDateTime::now_utc().unix_timestamp(),
            })?;
        }

        Ok(())
    }
}