-- name: create-table-hlstats-Events_ChangeRole

CREATE TABLE IF NOT EXISTS hlstats_Events_ChangeRole
(
    id        int(10) unsigned NOT NULL auto_increment,
    eventTime datetime         NOT NULL ,
    serverId  int(10) unsigned NOT NULL default '0',
    map       varchar(64)      NOT NULL default '',
    playerId  int(10) unsigned NOT NULL default '0',
    role      varchar(64)      NOT NULL default '',
    PRIMARY KEY (id),
    KEY playerId (playerId)
);