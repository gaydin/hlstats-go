-- name: create-table-hlstats-Teams

CREATE TABLE IF NOT EXISTS hlstats_Teams
(
    teamId             int(10) unsigned    NOT NULL auto_increment,
    game               varchar(32)         NOT NULL default 'valve',
    code               varchar(64)         NOT NULL default '',
    name               varchar(64)         NOT NULL default '',
    hidden             enum ('0','1')      NOT NULL default '0',
    playerlist_bgcolor varchar(7)                   default NULL,
    playerlist_color   varchar(7)                   default NULL,
    playerlist_index   tinyint(3) unsigned NOT NULL default '0',
    PRIMARY KEY (teamId),
    UNIQUE KEY gamecode (game, code)
);