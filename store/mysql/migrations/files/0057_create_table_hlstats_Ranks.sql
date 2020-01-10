-- name: create-table-hlstats-Ranks

CREATE TABLE IF NOT EXISTS hlstats_Ranks
(
    rankId   int(11) unsigned NOT NULL auto_increment,
    image    varchar(30)      NOT NULL,
    minKills int(11) unsigned NOT NULL default '0',
    maxKills int(11)          NOT NULL default '0',
    rankName varchar(50)      NOT NULL,
    game     varchar(32)      NOT NULL,
    PRIMARY KEY (rankId),
    UNIQUE KEY rankgame (image, game),
    KEY game (game(8))
) AUTO_INCREMENT = 1;