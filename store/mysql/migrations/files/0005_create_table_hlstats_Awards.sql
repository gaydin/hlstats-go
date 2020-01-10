-- name: create-table-hlstats-Awards

CREATE TABLE IF NOT EXISTS hlstats_Awards
(
    awardId        int(10) unsigned NOT NULL auto_increment,
    awardType      CHAR(1)          NOT NULL DEFAULT 'W',
    game           varchar(32)      NOT NULL default 'valve',
    code           varchar(128)     NOT NULL default '',
    name           varchar(128)     NOT NULL default '',
    verb           varchar(128)     NOT NULL default '',
    d_winner_id    int(10) unsigned          default NULL,
    d_winner_count int(10) unsigned          default NULL,
    g_winner_id    int(10) unsigned          default NULL,
    g_winner_count int(10) unsigned          default NULL,
    PRIMARY KEY (awardId),
    UNIQUE KEY code (game, awardType, code)
);
