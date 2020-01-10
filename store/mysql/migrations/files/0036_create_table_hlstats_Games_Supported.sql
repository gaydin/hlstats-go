-- name: create-table-hlstats-Games_Supported

CREATE TABLE IF NOT EXISTS hlstats_Games_Supported
(
    code varchar(32)  NOT NULL,
    name varchar(128) NOT NULL,
    PRIMARY KEY (code)
);