-- name: create-table-hlstats-Events_Suicides

CREATE TABLE IF NOT EXISTS hlstats_Events_Suicides
(
    id        int(10) unsigned NOT NULL auto_increment,
    eventTime datetime         NOT NULL ,
    serverId  int(10) unsigned NOT NULL default '0',
    map       varchar(64)      NOT NULL default '',
    playerId  int(10) unsigned NOT NULL default '0',
    weapon    varchar(64)      NOT NULL default '',
    pos_x     MEDIUMINT                 default NULL,
    pos_y     MEDIUMINT                 default NULL,
    pos_z     MEDIUMINT                 default NULL,
    PRIMARY KEY (id),
    KEY playerId (playerId)
);