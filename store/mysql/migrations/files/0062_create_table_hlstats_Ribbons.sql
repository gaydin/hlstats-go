-- name: create-table-hlstats-Ribbons

CREATE TABLE IF NOT EXISTS hlstats_Ribbons
(
    ribbonId   int(11) unsigned NOT NULL auto_increment,
    awardCode  varchar(50)      NOT NULL,
    awardCount int(11)          NOT NULL default '0',
    special    tinyint(3)       NOT NULL default '0',
    game       varchar(32)      NOT NULL,
    image      varchar(50)      NOT NULL,
    ribbonName varchar(50)      NOT NULL,
    PRIMARY KEY (ribbonId),
    UNIQUE KEY award (awardCode, awardCount, game, special)
);