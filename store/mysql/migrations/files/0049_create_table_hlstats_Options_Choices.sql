-- name: create-table-hlstats-Options_Choices

CREATE TABLE IF NOT EXISTS hlstats_Options_Choices
(
    keyname   varchar(32)  NOT NULL,
    value     varchar(128) NOT NULL,
    text      varchar(128) NOT NULL default '',
    isDefault tinyint(1)   NOT NULL default '0',
    PRIMARY KEY (keyname, value),
    KEY keyname (keyname)
);