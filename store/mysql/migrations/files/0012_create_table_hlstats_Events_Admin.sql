-- name: create-table-hlstats-Events_Admin

CREATE TABLE IF NOT EXISTS hlstats_Events_Admin
(
    id         int(10) unsigned NOT NULL auto_increment,
    eventTime  datetime         NOT NULL,
    serverId   int(10) unsigned NOT NULL default '0',
    map        varchar(64)      NOT NULL default '',
    type       varchar(64)      NOT NULL default 'Unknown',
    message    varchar(255)     NOT NULL default '',
    playerName varchar(64)      NOT NULL default '',
    PRIMARY KEY (id)
);