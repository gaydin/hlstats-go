-- name: create-table-hlstats-HostGroups

CREATE TABLE IF NOT EXISTS hlstats_HostGroups
(
    id      int(11)      NOT NULL auto_increment,
    pattern varchar(255) NOT NULL default '',
    name    varchar(255) NOT NULL default '',
    PRIMARY KEY (id)
) AUTO_INCREMENT = 1;
