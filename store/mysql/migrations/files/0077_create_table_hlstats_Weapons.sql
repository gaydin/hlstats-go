-- name: create-table-hlstats-Weapons

CREATE TABLE IF NOT EXISTS hlstats_Weapons
(
    weaponId  int(10) unsigned NOT NULL auto_increment,
    game      varchar(32)      NOT NULL default 'valve',
    code      varchar(64)      NOT NULL default '',
    name      varchar(128)     NOT NULL default '',
    modifier  float(10, 2)     NOT NULL default '1.00',
    kills     int(10) unsigned NOT NULL default '0',
    headshots int(10) unsigned NOT NULL default '0',
    PRIMARY KEY (weaponId),
    UNIQUE KEY gamecode (game, code),
    KEY code (code),
    KEY modifier (modifier)
);