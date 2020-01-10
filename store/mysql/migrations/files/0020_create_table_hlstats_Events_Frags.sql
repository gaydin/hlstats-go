-- name: create-table-hlstats-Events_Frags

CREATE TABLE IF NOT EXISTS hlstats_Events_Frags
(
    id           int(10) unsigned NOT NULL auto_increment,
    eventTime    datetime         NOT NULL ,
    serverId     int(10) unsigned NOT NULL default '0',
    map          varchar(64)      NOT NULL default '',
    killerId     int(10) unsigned NOT NULL default '0',
    victimId     int(10) unsigned NOT NULL default '0',
    weapon       varchar(64)      NOT NULL default '',
    headshot     tinyint(1)       NOT NULL default '0',
    killerRole   varchar(64)      NOT NULL default '',
    victimRole   varchar(64)      NOT NULL default '',
    pos_x        MEDIUMINT                 default NULL,
    pos_y        MEDIUMINT                 default NULL,
    pos_z        MEDIUMINT                 default NULL,
    pos_victim_x MEDIUMINT                 default NULL,
    pos_victim_y MEDIUMINT                 default NULL,
    pos_victim_z MEDIUMINT                 default NULL,
    PRIMARY KEY (id),
    KEY killerId (killerId),
    KEY victimId (victimId),
    KEY serverId (serverId),
    KEY headshot (headshot),
    KEY map (map(5)),
    KEY weapon16 (weapon(16)),
    KEY killerRole (killerRole(8))
);