CREATE TABLE notifications (
    id VARCHAR(32) NOT NULL PRIMARY KEY,
    user_id VARCHAR(64) NOT NULL,
    completed BOOL DEFAULT false,
    text TEXT NOT NULL,
    created_at BIGINT NOT NULL
);