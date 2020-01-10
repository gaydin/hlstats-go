-- name: create-table-hlstats-Options

CREATE TABLE IF NOT EXISTS hlstats_Options
(
    keyname varchar(32)  NOT NULL default '',
    value   varchar(128) NOT NULL default '',
    opttype TINYINT      NOT NULL DEFAULT '1',
    PRIMARY KEY (keyname),
    INDEX (opttype)
);