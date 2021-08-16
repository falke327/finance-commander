CREATE TABLE finance_commander.bank
(
    bic       VARCHAR(20)  NOT NULL,
    bank_name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_bank PRIMARY KEY (bic)
);

CREATE TABLE finance_commander.account
(
    iban        VARCHAR(50)                                         NOT NULL,
    bank        VARCHAR(20) REFERENCES finance_commander.bank (bic) NOT NULL,
    description VARCHAR(255),
    expires     DATE,
    CONSTRAINT pk_account PRIMARY KEY (iban)
);

CREATE TABLE finance_commander.banking_owner
(
    user_id    SERIAL       NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    CONSTRAINT pk_banking_owner PRIMARY KEY (user_id)
);

CREATE TABLE finance_commander.account_to_owner
(
    account_number VARCHAR(50) REFERENCES finance_commander.account (iban)      NOT NULL,
    banking_owner  INTEGER REFERENCES finance_commander.banking_owner (user_id) NOT NULL,
    CONSTRAINT pk_account_to_owner PRIMARY KEY (account_number, banking_owner)
);

CREATE TABLE finance_commander.category_group
(
    category_group_id   SERIAL       NOT NULL,
    category_group_name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_category_group PRIMARY KEY (category_group_id)
);

CREATE TABLE finance_commander.category
(
    category_id    SERIAL                                                                  NOT NULL,
    category_name  VARCHAR(100)                                                            NOT NULL,
    category_group INTEGER REFERENCES finance_commander.category_group (category_group_id) NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY (category_id)
);

CREATE TABLE finance_commander.transaction
(
    transaction_id      SERIAL                                                  NOT NULL,
    account_number      VARCHAR(50) REFERENCES finance_commander.account (iban) NOT NULL,
    value_date          DATE                                                    NOT NULL,
    applicant           VARCHAR(100)                                            NOT NULL,
    transaction_subject VARCHAR(255)                                            NOT NULL,
    transaction_value   NUMERIC(10, 2)                                          NOT NULL,
    category            INTEGER REFERENCES finance_commander.category (category_id),
    fixed               BOOLEAN,
    CONSTRAINT pk_transaction PRIMARY KEY (transaction_id)
);
