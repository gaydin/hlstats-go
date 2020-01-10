-- name: create-table-hlstats-Games

CREATE TABLE IF NOT EXISTS hlstats_Games
(
    code     varchar(32)    NOT NULL default '',
    name     varchar(128)   NOT NULL default '',
    hidden   enum ('0','1') NOT NULL default '0',
    realgame varchar(32)    NOT NULL default 'hl2mp',
    PRIMARY KEY (code)
);