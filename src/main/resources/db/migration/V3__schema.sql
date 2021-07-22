CREATE SCHEMA IF NOT EXISTS finance_commander AUTHORIZATION finance_commander;

ALTER SCHEMA finance_commander OWNER TO finance_commander;

ALTER DEFAULT PRIVILEGES IN SCHEMA finance_commander GRANT ALL PRIVILEGES ON TABLES TO finance_commander;

ALTER DEFAULT PRIVILEGES IN SCHEMA finance_commander GRANT USAGE ON SEQUENCES TO finance_commander;
