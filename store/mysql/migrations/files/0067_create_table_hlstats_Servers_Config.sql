-- name: create-table-hlstats-Servers_Config

CREATE TABLE IF NOT EXISTS hlstats_Servers_Config
(
    serverId       int(11) unsigned NOT NULL default '0',
    parameter      varchar(50)      NOT NULL,
    value          varchar(128)     NOT NULL,
    serverConfigId int(11) unsigned NOT NULL auto_increment,
    PRIMARY KEY (serverId, parameter),
    KEY serverConfigId (serverConfigId)
);