-- name: create-table-hlstats-Countries

CREATE TABLE IF NOT EXISTS hlstats_Countries
(
    flag varchar(16) NOT NULL,
    name varchar(50) NOT NULL,
    PRIMARY KEY (flag)
);