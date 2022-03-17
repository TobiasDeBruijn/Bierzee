use crate::DalResult;
use mysql::{OptsBuilder, Pool};
use std::ops::Deref;
use std::sync::Arc;

mod migrations {
    use refinery::embed_migrations;
    embed_migrations!("./mysql_migrations");
}

pub type ASql = Arc<Mysql>;

#[derive(Debug)]
pub struct Mysql(Pool);

impl Mysql {
    pub fn new(host: &str, database: &str, username: &str, password: &str) -> DalResult<Self> {
        let opts = OptsBuilder::new()
            .ip_or_hostname(Some(host))
            .db_name(Some(database))
            .user(Some(username))
            .pass(Some(password));
        let pool = Pool::new(opts)?;

        Ok(Self(pool))
    }

    pub fn migrate(&self) -> DalResult<()> {
        let mut conn = self.get_conn()?;
        migrations::migrations::runner().run(&mut conn)?;
        Ok(())
    }
}

impl Deref for Mysql {
    type Target = mysql::Pool;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
