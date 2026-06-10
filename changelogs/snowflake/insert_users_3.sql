--liquibase formatted sql

--changeset amalik:table_users
CREATE TABLE users (
    id INTEGER NOT NULL,
    username STRING NOT NULL,
    email STRING NOT NULL,
    status STRING DEFAULT 'pending' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT PK_USERS PRIMARY KEY (id),
    UNIQUE (username)
);
--rollback DROP TABLE USERS;

--changeset amalik:insert_alice expectedRowCount:1
INSERT INTO users (id, username, email, status) VALUES ('1', 'alice', 'alice@example.com', 'active');
--rollback DELETE from users where username = 'alice'

--changeset amalik:insert_bob expectedRowCount:1
INSERT INTO users (id, username, email, status) VALUES ('2', 'bob', 'bob@example.com', 'active');
--rollback DELETE from users where username = 'bob'

--changeset amalik:insert_charliejeffdavidtim expectedRowCount:3
INSERT INTO users (id, username, email, status) VALUES ('3', 'charlie', 'charlie@example.com', 'active');
INSERT INTO users (id, username, email, status) VALUES ('4', 'jeff', 'jeff@example.com', 'active');
INSERT INTO users (id, username, email, status) VALUES ('5', 'david', 'davic@example.com', 'active');
INSERT INTO users (id, username, email, status) VALUES ('6', 'tim', 'tim@example.com', 'active');

--rollback DELETE from users where username = 'charlie';
--rollback DELETE from users where username = 'jeff';
--rollback DELETE from users where username = 'david';
--rollback DELETE from users where username = 'tim';