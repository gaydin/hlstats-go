-- name: create-table-hlstats-Heatmap_Config

CREATE TABLE IF NOT EXISTS hlstats_Heatmap_Config
(
    id      int(255)    NOT NULL auto_increment,
    map     varchar(64) NOT NULL,
    game    varchar(32) NOT NULL,
    xoffset float       NOT NULL,
    yoffset float       NOT NULL,
    flipx   tinyint(1)  NOT NULL default '0',
    flipy   tinyint(1)  NOT NULL default '1',
    rotate  tinyint(1)  NOT NULL default '0',
    days    tinyint(4)  NOT NULL default '30',
    brush   varchar(5)  NOT NULL default 'small',
    scale   float       NOT NULL,
    font    tinyint(2)  NOT NULL default '10',
    thumbw  float       NOT NULL default '0.170312',
    thumbh  float       NOT NULL default '0.170312',
    cropx1  int(11)     NOT NULL default '0',
    cropy1  int(11)     NOT NULL default '0',
    cropx2  int(11)     NOT NULL default '0',
    cropy2  int(11)     NOT NULL default '0',
    PRIMARY KEY (id),
    UNIQUE KEY gamemap (map, game)
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8;