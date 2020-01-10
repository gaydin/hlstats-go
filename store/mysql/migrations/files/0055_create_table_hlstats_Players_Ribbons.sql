-- name: create-table-hlstats-Players_Ribbons

CREATE TABLE IF NOT EXISTS hlstats_Players_Ribbons
(
    playerId int(11) unsigned NOT NULL default '0',
    ribbonId int(11) unsigned NOT NULL default '0',
    game     varchar(32)      NOT NULL
);
