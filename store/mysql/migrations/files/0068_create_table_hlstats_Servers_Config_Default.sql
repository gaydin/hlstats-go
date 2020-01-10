-- name: create-table-hlstats-Servers_Config_Default

CREATE TABLE IF NOT EXISTS hlstats_Servers_Config_Default
(
    parameter   varchar(50)  NOT NULL,
    value       varchar(128) NOT NULL,
    description mediumtext character set utf8 collate utf8_unicode_ci,
    PRIMARY KEY (parameter)
);