-- name: create-table-geoLiteCity_Location

CREATE TABLE IF NOT EXISTS geoLiteCity_Location
(
    locId      bigint(11) unsigned NOT NULL default '0',
    country    varchar(2)          NOT NULL,
    region     varchar(50)                  default NULL,
    city       varchar(50)                  default NULL,
    postalCode varchar(10)                  default NULL,
    latitude   decimal(14, 4)               default NULL,
    longitude  decimal(14, 4)               default NULL,
    PRIMARY KEY (locId)
);