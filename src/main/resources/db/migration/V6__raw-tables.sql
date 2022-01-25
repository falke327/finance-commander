-- These tables will be used as an approval step for inserting data into the working logic tables
CREATE TABLE finance_commander.transaction_raw
(
    transaction_raw_id  SERIAL                                                  NOT NULL,
    account_number      VARCHAR(50) REFERENCES finance_commander.account (iban) NOT NULL,
    value_date          DATE                                                    NOT NULL,
    applicant           VARCHAR(100)                                            NOT NULL,
    transaction_subject VARCHAR(255)                                            NOT NULL,
    transaction_value   NUMERIC(10, 2)                                          NOT NULL,
    category            INTEGER REFERENCES finance_commander.category (category_id),
    fixed               BOOLEAN,
    approved            BOOLEAN                 DEFAULT false                   NOT NULL,
    CONSTRAINT pk_transaction_raw PRIMARY KEY (transaction_raw_id)
);

CREATE TABLE finance_commander.asset_order_raw
(
    order_raw_id   SERIAL                                                            NOT NULL,
    deposit_number VARCHAR(50) REFERENCES finance_commander.deposit (deposit_number) NOT NULL,
    booking_date   DATE                                                              NOT NULL,
    asset          INTEGER REFERENCES finance_commander.asset (asset_id)             NOT NULL,
    amount         NUMERIC(10, 4)                                                    NOT NULL,
    price          NUMERIC(10, 2)                                                    NOT NULL,
    description    VARCHAR(255),
    approved       BOOLEAN                 DEFAULT false                             NOT NULL,
    CONSTRAINT pk_asset_order_raw PRIMARY KEY (order_raw_id)
);

CREATE TABLE finance_commander.stock_price_raw
(
    raw_id        BIGSERIAL                                             NOT NULL,
    asset_id      INTEGER REFERENCES finance_commander.asset (asset_id) NOT NULL,
    value_date    DATE                                                  NOT NULL,
    current_value NUMERIC(10, 4)                                        NOT NULL,
    approved      BOOLEAN                 DEFAULT false                 NOT NULL,
    CONSTRAINT pk_stock_price_raw PRIMARY KEY (raw_id)
);
