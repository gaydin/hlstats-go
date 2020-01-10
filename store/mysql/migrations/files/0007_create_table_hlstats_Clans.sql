-- name: create-table-hlstats-Clans

CREATE TABLE IF NOT EXISTS hlstats_Clans
(
    clanId    int(10) unsigned    NOT NULL auto_increment,
    tag       varchar(64)         NOT NULL default '',
    name      varchar(128)        NOT NULL default '',
    homepage  varchar(64)         NOT NULL default '',
    game      varchar(32)         NOT NULL default '',
    hidden    tinyint(3) unsigned NOT NULL default '0',
    mapregion varchar(128)        NOT NULL default '',
    PRIMARY KEY (clanId),
    UNIQUE KEY tag (game, tag),
    KEY game (game)
);