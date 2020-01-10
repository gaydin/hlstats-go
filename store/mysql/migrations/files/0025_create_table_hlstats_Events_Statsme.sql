-- name: create-table-hlstats-Events_Statsme

CREATE TABLE IF NOT EXISTS hlstats_Events_Statsme
(
    id        int(10) unsigned NOT NULL auto_increment,
    eventTime datetime         NOT NULL ,
    serverId  int(10) unsigned NOT NULL default '0',
    map       varchar(64)      NOT NULL default '',
    playerId  int(10) unsigned NOT NULL default '0',
    weapon    varchar(64)      NOT NULL default '',
    shots     int(6) unsigned  NOT NULL default '0',
    hits      int(6) unsigned  NOT NULL default '0',
    headshots int(6) unsigned  NOT NULL default '0',
    damage    int(6) unsigned  NOT NULL default '0',
    kills     int(6) unsigned  NOT NULL default '0',
    deaths    int(6) unsigned  NOT NULL default '0',
    PRIMARY KEY (id),
    KEY playerId (playerId),
    KEY weapon (weapon)
);