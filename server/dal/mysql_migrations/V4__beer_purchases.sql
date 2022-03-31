CREATE TABLE beer_purchases (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(64) NOT NULL,
    crates INT NOT NULL,
    amount_paid DOUBLE NOT NULL,
    date BIGINT NOT NULL
);