-- name: create-table-hlstats-Livestats

CREATE TABLE IF NOT EXISTS hlstats_Livestats
(
    player_id    int(10)     NOT NULL default '0',
    server_id    int(10)     NOT NULL default '0',
    cli_address  varchar(32) NOT NULL default '',
    cli_city     varchar(64) NOT NULL default '',
    cli_country  varchar(64) NOT NULL default '',
    cli_flag     varchar(16) NOT NULL default '',
    cli_state    varchar(64) NOT NULL default '',
    cli_lat      FLOAT(7, 4) NULL,
    cli_lng      FLOAT(7, 4) NULL,
    steam_id     varchar(64) NOT NULL default '',
    name         varchar(64) NOT NULL,
    team         varchar(64) NOT NULL default '',
    kills        int(6)      NOT NULL default '0',
    deaths       int(6)      NOT NULL default '0',
    suicides     int(6)      NOT NULL default '0',
    headshots    int(6)      NOT NULL default '0',
    shots        int(11)     NOT NULL default '0',
    hits         int(11)     NOT NULL default '0',
    is_dead      tinyint(1)  NOT NULL default '0',
    has_bomb     int(1)      NOT NULL default '0',
    ping         int(6)      NOT NULL default '0',
    connected    int(10)     NOT NULL default '0',
    skill_change int(10)     NOT NULL default '0',
    skill        int(10)     NOT NULL default '0',
    PRIMARY KEY (player_id)
) ENGINE = MEMORY;