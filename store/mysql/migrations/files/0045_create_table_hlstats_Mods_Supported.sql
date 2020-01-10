-- name: create-table-hlstats-Mods_Supported

CREATE TABLE IF NOT EXISTS hlstats_Mods_Supported
(
    code varchar(32)  NOT NULL,
    name varchar(128) NOT NULL,
    PRIMARY KEY (code)
);
