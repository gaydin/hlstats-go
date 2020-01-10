-- name: create-table-hlstats-Servers_VoiceComm

CREATE TABLE IF NOT EXISTS hlstats_Servers_VoiceComm
(
    serverId   int(11) unsigned NOT NULL auto_increment,
    name       varchar(128)     NOT NULL,
    addr       varchar(128)     NOT NULL,
    password   varchar(128)              default NULL,
    descr      varchar(255)              default NULL,
    queryPort  int(11) unsigned NOT NULL default '51234',
    UDPPort    int(11) unsigned NOT NULL default '8767',
    serverType tinyint(4)       NOT NULL default '0',
    PRIMARY KEY (serverId),
    UNIQUE KEY address (addr, UDPPort, queryPort)
);
