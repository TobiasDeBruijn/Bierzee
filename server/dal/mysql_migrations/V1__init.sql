CREATE TABLE users (
    id VARCHAR(64) PRIMARY KEY NOT NULL,
    name VARCHAR(64) NOT NULL,
    is_admin BOOL NOT NULL DEFAULT false
);

CREATE TABLE beers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(64) NOT NULL,
    consumed_at BIGINT NOT NULL
);

CREATE TABLE payments (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(64) NOT NULL,
    paid_at BIGINT NOT NULL,
    amount_paid DOUBLE NOT NULL
);

CREATE TABLE sessions (
    id VARCHAR(32) PRIMARY KEY NOT NULL,
    user_id VARCHAR(64) NOT NULL,
    expires_at BIGINT NOT NULL
);

CREATE TABLE system (
    name VARCHAR(32) PRIMARY KEY NOT NULL,
    value VARCHAR(32) NOT NULL,
    last_updated BIGINT NOT NULL,
    last_updated_by VARCHAR(64) NOT NULL
);