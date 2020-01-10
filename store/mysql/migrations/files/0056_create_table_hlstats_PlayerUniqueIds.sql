-- name: create-table-hlstats-PlayerUniqueIds

CREATE TABLE IF NOT EXISTS hlstats_PlayerUniqueIds
(
    playerId int(10) unsigned NOT NULL default '0',
    uniqueId varchar(64)      NOT NULL default '',
    game     varchar(32)      NOT NULL default '',
    merge    int(10) unsigned          default NULL,
    PRIMARY KEY (uniqueId, game),
    KEY playerId (playerId)
);