CREATE USER ${fc-schema} with password 'finance21';
-- TODO: get better password if not used in local dev system

CREATE DATABASE ${fc-schema} OWNER ${fc-schema};

CREATE SCHEMA IF NOT EXISTS ${fc-schema} AUTHORIZATION ${fc-schema};

ALTER SCHEMA ${fc-schema} OWNER TO ${fc-schema};

ALTER DEFAULT PRIVILEGES IN SCHEMA ${fc-schema} GRANT ALL PRIVILEGES ON TABLES TO ${fc-schema};

ALTER DEFAULT PRIVILEGES IN SCHEMA ${fc-schema} GRANT USAGE ON SEQUENCES TO ${fc-schema};
