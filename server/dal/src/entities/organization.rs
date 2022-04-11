use mysql::prelude::Queryable;
use mysql::{params, Row};
use rand::Rng;
use crate::{ASql, DalResult};
use crate::hashing::hash;

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
    pub fn get_by_code(pool: ASql, code: &str) -> DalResult<Option<Self>> {
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

        let code: u64 = rand::thread_rng().gen_range(0..1) * 1_000_0000;
        let code = code.to_string();

        let mut conn = pool.get_conn()?;
        conn.exec_drop("INSERT INTO organizations (id, name, hash, created_at) VALUES (:id, :name, :hash, :created_at)", params! {
            "id" => &id,
            "name" => &buildable.name,
            "hash" => &hash,
            "code" => &code,
            "created_at" => now
        })?;

        Ok(Self {
            pool,
            id,
            name: buildable.name,
            hash,
            code,
            created_at: now
        })
    }
}