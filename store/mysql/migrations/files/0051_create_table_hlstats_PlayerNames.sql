-- name: create-table-hlstats-PlayerNames

CREATE TABLE IF NOT EXISTS hlstats_PlayerNames
(
    playerId        int(10) unsigned NOT NULL default '0',
    name            varchar(64)      NOT NULL default '',
    lastuse         datetime         NOT NULL ,
    connection_time int(11) unsigned NOT NULL default '0',
    numuses         int(10) unsigned NOT NULL default '0',
    kills           int(11) unsigned NOT NULL default '0',
    deaths          int(11) unsigned NOT NULL default '0',
    suicides        int(11) unsigned NOT NULL default '0',
    headshots       int(11) unsigned NOT NULL default '0',
    shots           int(11) unsigned NOT NULL default '0',
    hits            int(11) unsigned NOT NULL default '0',
    PRIMARY KEY (playerId, name),
    KEY name16 (name(16))
);