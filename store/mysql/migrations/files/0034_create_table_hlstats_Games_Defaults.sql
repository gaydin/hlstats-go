-- name: create-table-hlstats-Games_Defaults

CREATE TABLE IF NOT EXISTS hlstats_Games_Defaults
(
    code      varchar(32)  NOT NULL,
    parameter varchar(50)  NOT NULL,
    value     varchar(128) NOT NULL,
    PRIMARY KEY (code, parameter)
);