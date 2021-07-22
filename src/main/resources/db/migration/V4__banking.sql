CREATE TABLE finance_commander.bank
(
    bic       VARCHAR(20)  NOT NULL PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL
);

CREATE TABLE finance_commander.account
(
    iban        VARCHAR(50)                                         NOT NULL PRIMARY KEY,
    bank        VARCHAR(20) REFERENCES finance_commander.bank (bic) NOT NULL,
    description VARCHAR(255),
    expires     DATE
);

CREATE TABLE finance_commander.banking_owner
(
    user_id    INTEGER      NOT NULL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL
);

CREATE TABLE finance_commander.account_to_owner
(
    account_number VARCHAR(50) REFERENCES finance_commander.account (iban)      NOT NULL,
    banking_owner  INTEGER REFERENCES finance_commander.banking_owner (user_id) NOT NULL,
    CONSTRAINT PK_ACCOUNT_TO_OWNER PRIMARY KEY (account_number, banking_owner)
);

CREATE TABLE finance_commander.category
(
    category_name  VARCHAR(100) NOT NULL PRIMARY KEY,
    category_group VARCHAR(100) NOT NULL
);

-- TODO: insert category_group

CREATE TABLE finance_commander.transaction
(
    transaction_id      INTEGER                                                 NOT NULL PRIMARY KEY,
    account_number      VARCHAR(50) REFERENCES finance_commander.account (iban) NOT NULL,
    value_date          DATE                                                    NOT NULL,
    applicant           VARCHAR(100)                                            NOT NULL,
    transaction_subject VARCHAR(255)                                            NOT NULL,
    transaction_value   NUMERIC(10, 2)                                          NOT NULL,
    category            VARCHAR(100) REFERENCES finance_commander.category (category_name),
    fixed               BOOLEAN
);
