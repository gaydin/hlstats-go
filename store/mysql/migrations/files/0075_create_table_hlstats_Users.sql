-- name: create-table-hlstats-Users

CREATE TABLE IF NOT EXISTS hlstats_Users
(
    username varchar(16) NOT NULL default '',
    password varchar(32) NOT NULL default '',
    acclevel int(11)     NOT NULL default '0',
    playerId int(11)     NOT NULL default '0',
    PRIMARY KEY (username)
);