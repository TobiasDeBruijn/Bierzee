use crate::config::Config;
use dal::Mysql;
use std::sync::Arc;

pub type WebData = actix_web::web::Data<Arc<AppData>>;

#[derive(Debug)]
pub struct AppData {
    pub config: Config,
    pub mysql: Arc<Mysql>,
}

impl AppData {
    pub fn new(config: Config) -> Result<Self, dal::Error> {
        let mysql = Mysql::new(&config.mysql_host, &config.mysql_database, &config.mysql_username, &config.mysql_password)?;
        mysql.migrate()?;

        Ok(Self {
            config,
            mysql: Arc::new(mysql),
        })
    }
}
