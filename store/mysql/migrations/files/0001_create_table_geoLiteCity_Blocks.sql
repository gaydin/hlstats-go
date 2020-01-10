-- name: create-table-geoLiteCity_Blocks

CREATE TABLE IF NOT EXISTS geoLiteCity_Blocks (
  startIpNum bigint(11) unsigned NOT NULL default '0',
  endIpNum bigint(11) unsigned NOT NULL default '0',
  locId bigint(11) unsigned NOT NULL default '0'
);