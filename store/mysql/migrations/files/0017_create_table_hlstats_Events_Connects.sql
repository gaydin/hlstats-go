-- name: create-table-hlstats-Events_Connects

CREATE TABLE IF NOT EXISTS hlstats_Events_Connects
(
    id                   int(10) unsigned NOT NULL auto_increment,
    eventTime            datetime         NOT NULL,
    serverId             int(10) unsigned NOT NULL default '0',
    map                  varchar(64)      NOT NULL default '',
    playerId             int(10) unsigned NOT NULL default '0',
    ipAddress            varchar(32)      NOT NULL default '',
    hostname             varchar(255)     NOT NULL default '',
    hostgroup            varchar(255)     NOT NULL default '',
    eventTime_Disconnect datetime                  default NULL,
    PRIMARY KEY (id),
    KEY playerId (playerId)
);