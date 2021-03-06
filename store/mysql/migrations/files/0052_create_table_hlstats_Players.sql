-- name: create-table-hlstats-Players

CREATE TABLE IF NOT EXISTS hlstats_Players
(
    playerId          int(10) unsigned NOT NULL auto_increment,
    last_event        int(11)          NOT NULL default '0',
    connection_time   int(11) unsigned NOT NULL default '0',
    lastName          varchar(64)      NOT NULL default '',
    lastAddress       varchar(32)      NOT NULL default '',
    city              varchar(64)      NOT NULL default '',
    state             varchar(64)      NOT NULL default '',
    country           varchar(64)      NOT NULL default '',
    flag              varchar(16)      NOT NULL default '',
    lat               FLOAT(7, 4)      NULL,
    lng               FLOAT(7, 4)      NULL,
    clan              int(10) unsigned NOT NULL default '0',
    kills             int(11) unsigned NOT NULL default '0',
    deaths            int(11) unsigned NOT NULL default '0',
    suicides          int(11) unsigned NOT NULL default '0',
    skill             int(11) unsigned NOT NULL default '1000',
    shots             int(11) unsigned NOT NULL default '0',
    hits              int(11) unsigned NOT NULL default '0',
    teamkills         int(11) unsigned NOT NULL default '0',
    fullName          varchar(128)              default NULL,
    email             varchar(64)               default NULL,
    homepage          varchar(64)               default NULL,
    icq               int(10) unsigned          default NULL,
    game              varchar(32)      NOT NULL,
    hideranking       int(1) unsigned  NOT NULL default '0',
    headshots         int(10) unsigned NOT NULL default '0',
    last_skill_change int(11)          NOT NULL default '0',
    displayEvents     int(1) unsigned  NOT NULL default '1',
    kill_streak       int(6)           NOT NULL default '0',
    death_streak      int(6)           NOT NULL default '0',
    blockavatar       int(1) unsigned  NOT NULL default '0',
    activity          int(11)          NOT NULL default '100',
    createdate        int(11)          NOT NULL default '0',
    PRIMARY KEY (playerId),
    KEY playerclan (clan, playerId),
    KEY skill (skill),
    KEY game (game),
    KEY kills (kills),
    KEY hideranking (hideranking)
);