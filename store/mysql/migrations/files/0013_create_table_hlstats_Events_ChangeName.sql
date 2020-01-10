-- name: create-table-hlstats-Events_ChangeName

CREATE TABLE IF NOT EXISTS hlstats_Events_ChangeName
(
    id        int(10) unsigned NOT NULL auto_increment,
    eventTime datetime         NOT NULL ,
    serverId  int(10) unsigned NOT NULL default '0',
    map       varchar(64)      NOT NULL default '',
    playerId  int(10) unsigned NOT NULL default '0',
    oldName   varchar(64)      NOT NULL default '',
    newName   varchar(64)      NOT NULL default '',
    PRIMARY KEY (id),
    KEY playerId (playerId)
);