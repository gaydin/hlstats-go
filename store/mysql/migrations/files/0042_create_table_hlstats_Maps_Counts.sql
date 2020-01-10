-- name: create-table-hlstats-Maps_Counts

CREATE TABLE hlstats_Maps_Counts
(
    rowId     int(11)                        NOT NULL auto_increment,
    game      varchar(32) character set utf8 NOT NULL,
    map       varchar(64) character set utf8 NOT NULL,
    kills     int(11)                        NOT NULL,
    headshots int(11)                        NOT NULL,
    PRIMARY KEY (game, map),
    INDEX (rowId)
);