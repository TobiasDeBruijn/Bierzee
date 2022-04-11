use serde::Deserialize;

#[derive(Debug, Clone, Deserialize)]
pub struct Config {
    pub mysql_host: String,
    pub mysql_database: String,
    pub mysql_username: String,
    pub mysql_password: String,
    pub pepper: String,
}

impl Config {
    pub fn new() -> Result<Self, envy::Error> {
        envy::from_env()
    }
}
