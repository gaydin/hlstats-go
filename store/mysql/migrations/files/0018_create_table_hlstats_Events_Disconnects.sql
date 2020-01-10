-- name: create-table-hlstats-Events_Disconnects

CREATE TABLE IF NOT EXISTS hlstats_Events_Disconnects
(
    id        int(10) unsigned NOT NULL auto_increment,
    eventTime datetime         NOT NULL ,
    serverId  int(10) unsigned NOT NULL default '0',
    map       varchar(64)      NOT NULL default '',
    playerId  int(10) unsigned NOT NULL default '0',
    PRIMARY KEY (id)
);