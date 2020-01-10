-- name: create-table-hlstats-Mods_Defaults

CREATE TABLE IF NOT EXISTS hlstats_Mods_Defaults
(
    code      varchar(32)  NOT NULL,
    parameter varchar(50)  NOT NULL,
    value     varchar(128) NOT NULL,
    PRIMARY KEY (code, parameter)
);