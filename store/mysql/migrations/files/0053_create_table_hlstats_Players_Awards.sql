-- name: create-table-hlstats-Players_Awards

CREATE TABLE IF NOT EXISTS hlstats_Players_Awards
(
    awardTime date             NOT NULL,
    awardId   int(11) unsigned NOT NULL default '0',
    playerId  int(11) unsigned NOT NULL default '0',
    count     int(11) unsigned NOT NULL default '0',
    game      varchar(32)      NOT NULL,
    PRIMARY KEY (awardTime, awardId, playerId, game)
);