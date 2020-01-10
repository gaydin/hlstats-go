-- name: create-table-hlstats-Events_Rcon

CREATE TABLE IF NOT EXISTS hlstats_Events_Rcon
(
    id        int(10) unsigned NOT NULL auto_increment,
    eventTime datetime         NOT NULL,
    serverId  int(10) unsigned NOT NULL default '0',
    map       varchar(64)      NOT NULL default '',
    type      varchar(6)       NOT NULL default 'UNK',
    remoteIp  varchar(32)      NOT NULL default '',
    password  varchar(128)     NOT NULL default '',
    command   varchar(255)     NOT NULL default '',
    PRIMARY KEY (id)
);