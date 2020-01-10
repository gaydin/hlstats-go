-- name: create-table-hlstats-ClanTags

CREATE TABLE IF NOT EXISTS hlstats_ClanTags
(
    id       int(10) unsigned              NOT NULL auto_increment,
    pattern  varchar(64)                   NOT NULL,
    position enum ('EITHER','START','END') NOT NULL default 'EITHER',
    PRIMARY KEY (id),
    UNIQUE KEY pattern (pattern)
);