-- name: create-table-hlstats-Trend

CREATE TABLE IF NOT EXISTS hlstats_Trend
(
    timestamp int(11)     NOT NULL default '0',
    game      varchar(32) NOT NULL default '',
    players   int(11)     NOT NULL default '0',
    kills     int(11)     NOT NULL default '0',
    headshots int(11)     NOT NULL default '0',
    servers   int(11)     NOT NULL default '0',
    act_slots int(11)     NOT NULL default '0',
    max_slots int(11)     NOT NULL default '0',
    KEY game (game),
    KEY timestamp (timestamp)
);
