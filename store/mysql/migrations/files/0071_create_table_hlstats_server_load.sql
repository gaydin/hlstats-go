-- name: create-table-hlstats-server_load

CREATE TABLE IF NOT EXISTS hlstats_server_load
(
    server_id   int(10)     NOT NULL default '0',
    timestamp   int(11)     NOT NULL default '0',
    act_players tinyint(2)  NOT NULL default '0',
    min_players tinyint(2)  NOT NULL default '0',
    max_players tinyint(2)  NOT NULL default '0',
    map         varchar(64)          default NULL,
    uptime      varchar(10) NOT NULL default '0',
    fps         varchar(10) NOT NULL default '0',
    KEY server_id (server_id),
    KEY timestamp (timestamp)
);
