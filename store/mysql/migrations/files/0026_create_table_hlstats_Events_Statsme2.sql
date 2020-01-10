-- name: create-table-hlstats-Events_Statsme2

CREATE TABLE IF NOT EXISTS hlstats_Events_Statsme2
(
    id        int(10) unsigned NOT NULL auto_increment,
    eventTime datetime         NOT NULL ,
    serverId  int(10) unsigned NOT NULL default '0',
    map       varchar(64)      NOT NULL default '',
    playerId  int(10) unsigned NOT NULL default '0',
    weapon    varchar(64)      NOT NULL default '',
    head      int(6) unsigned  NOT NULL default '0',
    chest     int(6) unsigned  NOT NULL default '0',
    stomach   int(6) unsigned  NOT NULL default '0',
    leftarm   int(6) unsigned  NOT NULL default '0',
    rightarm  int(6) unsigned  NOT NULL default '0',
    leftleg   int(6) unsigned  NOT NULL default '0',
    rightleg  int(6) unsigned  NOT NULL default '0',
    PRIMARY KEY (id),
    KEY playerId (playerId),
    KEY weapon (weapon)
);