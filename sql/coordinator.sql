CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SCHEMA IF NOT EXISTS jabar;
CREATE SCHEMA IF NOT EXISTS jateng;
CREATE SCHEMA IF NOT EXISTS jatim;

CREATE SERVER jabar_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'postgres_jabar',
    dbname 'db_jabar',
    port '5432'
);

CREATE USER MAPPING FOR postgres
SERVER jabar_server
OPTIONS (
    user 'postgres',
    password 'postgres'
);

CREATE SERVER jateng_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'postgres_jateng',
    dbname 'db_jateng',
    port '5432'
);

CREATE USER MAPPING FOR postgres
SERVER jateng_server
OPTIONS (
    user 'postgres',
    password 'postgres'
);

CREATE SERVER jatim_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'postgres_jatim',
    dbname 'db_jatim',
    port '5432'
);

CREATE USER MAPPING FOR postgres
SERVER jatim_server
OPTIONS (
    user 'postgres',
    password 'postgres'
);