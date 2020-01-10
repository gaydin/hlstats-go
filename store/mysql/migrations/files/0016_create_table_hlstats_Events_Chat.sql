-- name: create-table-hlstats-Events_Chat

CREATE TABLE IF NOT EXISTS hlstats_Events_Chat
(
    id           int(10) unsigned NOT NULL auto_increment,
    eventTime    datetime         NOT NULL ,
    serverId     int(10) unsigned NOT NULL default '0',
    map          varchar(64)      NOT NULL default '',
    playerId     int(10) unsigned NOT NULL default '0',
    message_mode tinyint(2)       NOT NULL default '0',
    message      varchar(128)     NOT NULL default '',
    PRIMARY KEY (id),
    KEY playerId (playerId),
    KEY serverId (serverId),
    FULLTEXT KEY message (message)
);