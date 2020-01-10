-- name: create-table-hlstats-Actions

CREATE TABLE IF NOT EXISTS hlstats_Actions
(
    id                      int(10) unsigned NOT NULL auto_increment,
    game                    varchar(32)      NOT NULL default 'valve',
    code                    varchar(64)      NOT NULL default '',
    reward_player           int(11)          NOT NULL default '10',
    reward_team             int(11)          NOT NULL default '0',
    team                    varchar(64)      NOT NULL default '',
    description             varchar(128)              default NULL,
    for_PlayerActions       enum ('0','1')   NOT NULL default '0',
    for_PlayerPlayerActions enum ('0','1')   NOT NULL default '0',
    for_TeamActions         enum ('0','1')   NOT NULL default '0',
    for_WorldActions        enum ('0','1')   NOT NULL default '0',
    count                   int(10) unsigned NOT NULL default '0',
    PRIMARY KEY (id),
    UNIQUE KEY gamecode (code, game, team),
    KEY code (code)
);