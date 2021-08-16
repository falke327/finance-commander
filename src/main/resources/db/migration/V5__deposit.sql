CREATE TABLE finance_commander.deposit
(
    deposit_number VARCHAR(50)                                         NOT NULL,
    bank           VARCHAR(20) REFERENCES finance_commander.bank (bic) NOT NULL,
    description    VARCHAR(255),
    expires        DATE,
    CONSTRAINT pk_deposit PRIMARY KEY (deposit_number)
);

CREATE TABLE finance_commander.deposit_to_owner
(
    deposit_number VARCHAR(50) REFERENCES finance_commander.deposit (deposit_number) NOT NULL,
    banking_owner  INTEGER REFERENCES finance_commander.banking_owner (user_id)      NOT NULL,
    CONSTRAINT pk_deposit_to_owner PRIMARY KEY (deposit_number, banking_owner)
);

CREATE TABLE finance_commander.asset
(
    asset_id    SERIAL       NOT NULL,
    asset_name  VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    CONSTRAINT pk_asset PRIMARY KEY (asset_id)
);

CREATE TABLE finance_commander.asset_order
(
    order_id       SERIAL                                                            NOT NULL,
    deposit_number VARCHAR(50) REFERENCES finance_commander.deposit (deposit_number) NOT NULL,
    booking_date   DATE                                                              NOT NULL,
    asset          INTEGER REFERENCES finance_commander.asset (asset_id)             NOT NULL,
    amount         NUMERIC(10, 4)                                                    NOT NULL,
    price          NUMERIC(10, 2)                                                    NOT NULL,
    description    VARCHAR(255),
    CONSTRAINT pk_asset_order PRIMARY KEY (order_id)
);

CREATE TABLE finance_commander.stock_price
(
    id            BIGSERIAL                                             NOT NULL,
    asset_id      INTEGER REFERENCES finance_commander.asset (asset_id) NOT NULL,
    value_date    DATE                                                  NOT NULL,
    current_value NUMERIC(10, 4)                                        NOT NULL,
    CONSTRAINT pk_stock_price PRIMARY KEY (id)
);
