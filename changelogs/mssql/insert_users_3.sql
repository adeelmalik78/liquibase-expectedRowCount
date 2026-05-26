--liquibase formatted sql

--changeset amalik:table_users
CREATE TABLE dbo.users (
    id INT IDENTITY(1,1) NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_USERS PRIMARY KEY (id),
    UNIQUE (username)
);
--rollback DROP TABLE dbo.USERS;

--changeset amalik:insert_alice expectedRowCount:1
INSERT INTO users (username, email, status) VALUES ('alice', 'alice@example.com', 'active');
--rollback DELETE from users where username = 'alice'

--changeset amalik:insert_bob expectedRowCount:1
INSERT INTO users (username, email, status) VALUES ('bob', 'bob@example.com', 'active');
--rollback DELETE from users where username = 'bob'

--changeset amalik:insert_charlie expectedRowCount:3
INSERT INTO users (username, email, status) VALUES ('charlie', 'charlie@example.com', 'active');
INSERT INTO users (username, email, status) VALUES ('jeff', 'jeff@example.com', 'active');
INSERT INTO users (username, email, status) VALUES ('david', 'davic@example.com', 'active');
INSERT INTO users (username, email, status) VALUES ('tim', 'tim@example.com', 'active');

--rollback DELETE from users where username = 'charlie'
--rollback DELETE from users where username = 'jeff'
--rollback DELETE from users where username = 'david'
--rollback DELETE from users where username = 'tim'
