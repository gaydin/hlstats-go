-- name: create-table-hlstats-Players_History

CREATE TABLE IF NOT EXISTS hlstats_Players_History
(
    playerId        int(10) unsigned NOT NULL default '0',
    eventTime       date             NOT NULL,
    connection_time int(10) unsigned NOT NULL default '0',
    kills           int(11) unsigned NOT NULL default '0',
    deaths          int(11) unsigned NOT NULL default '0',
    suicides        int(11) unsigned NOT NULL default '0',
    skill           int(11) unsigned NOT NULL default '1000',
    shots           int(11) unsigned NOT NULL default '0',
    hits            int(11) unsigned NOT NULL default '0',
    game            varchar(32)      NOT NULL default '',
    headshots       int(11) unsigned NOT NULL default '0',
    teamkills       int(11) unsigned NOT NULL default '0',
    kill_streak     int(6)           NOT NULL default '0',
    death_streak    int(6)           NOT NULL default '0',
    skill_change    int(11)          NOT NULL default '0',
    UNIQUE KEY eventTime (eventTime, playerId, game),
    KEY playerId (playerId)
);