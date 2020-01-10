-- name: create-table-hlstats-Events_StatsmeTime

CREATE TABLE IF NOT EXISTS hlstats_Events_StatsmeTime
(
    id        int(10) unsigned NOT NULL auto_increment,
    eventTime datetime         NOT NULL ,
    serverId  int(10) unsigned NOT NULL default '0',
    map       varchar(64)      NOT NULL default '',
    playerId  int(10) unsigned NOT NULL default '0',
    time      time             NOT NULL default '00:00:00',
    PRIMARY KEY (id),
    KEY playerId (playerId)
);