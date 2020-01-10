-- name: create-table-hlstats-Roles

CREATE TABLE IF NOT EXISTS hlstats_Roles
(
    roleId int(10) unsigned NOT NULL auto_increment,
    game   varchar(32)      NOT NULL default 'valve',
    code   varchar(64)      NOT NULL default '',
    name   varchar(64)      NOT NULL default '',
    hidden enum ('0','1')   NOT NULL default '0',
    picked int(6) unsigned  NOT NULL default '0',
    kills  int(6) unsigned  NOT NULL default '0',
    deaths int(6) unsigned  NOT NULL default '0',
    PRIMARY KEY (roleId),
    UNIQUE KEY gamecode (game, code)
);