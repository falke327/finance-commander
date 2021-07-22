DO
$do$
    BEGIN
        IF NOT EXISTS (
                SELECT FROM pg_catalog.pg_roles  -- SELECT list can be empty for this
                WHERE  rolname = 'finance_commander') THEN

            CREATE ROLE finance_commander LOGIN PASSWORD 'finance21';
        END IF;
    END
$do$;