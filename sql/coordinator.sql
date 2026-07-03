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

IMPORT FOREIGN SCHEMA public
LIMIT TO (laporan)
FROM SERVER jabar_server
INTO jabar;

-- lanjutkan untuk jateng

-- lanjutkan untuk jatim

CREATE VIEW laporan_semua AS
SELECT * FROM jabar.laporan
UNION ALL
SELECT * FROM jateng.laporan
UNION ALL
SELECT * FROM jatim.laporan;