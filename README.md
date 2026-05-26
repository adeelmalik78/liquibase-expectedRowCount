# expectedRowCount

## Usage
``` sql
--changeset amalik:insert_alice expectedRowCount:1
INSERT INTO users (username, email, status) VALUES ('alice', 'alice@example.com', 'active');
--rollback DELETE from users where username = 'alice'
```

## NOTE
You must obtain the `liquibase-expected-row-count.jar` from Liquibase and place it in your `<LIQUIBASE_HOME_DIR>/lib` directory.

Running `liquibase --version` should show this jar file as this: 
```
- lib/liquibase-expected-row-count-1.0.0-SNAPSHOT.jar: Liquibase Expected Row Count Extension 1.0.0-SNAPSHOT
```