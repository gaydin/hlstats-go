package mysql

import (
	"fmt"
	"log"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"

	"go-hlstats/store/mysql/migrations"
)

type DataStore struct {
	*sqlx.DB
}

func New(config string) (*DataStore, error) {
	db, err := connect("mysql", config)
	if err != nil {
		return nil, err
	}
	db.SetConnMaxLifetime(3595 * time.Second)
	return &DataStore{
		DB: db,
	}, nil
}

func connect(driver, config string) (*sqlx.DB, error) {
	db, err := sqlx.Open(driver, config)
	if err != nil {
		return nil, err
	}

	if err := db.Ping(); err != nil {
		return nil, err
	}

	// hack for init migration table when detect db php hlstatsx
	if needCreateMigrationTable(db) {
		if err := createMigrationTable(db); err != nil {
			log.Println(err)
			return nil, err
		}
		if err := insertMigrationTableData(db); err != nil {
			log.Println(err)
			return nil, err
		}
	}

	if err := migrations.Migrate(db.DB); err != nil {
		return nil, fmt.Errorf("migration fail: %v", err)
	}

	return db, nil
}

func needCreateMigrationTable(db *sqlx.DB) bool {
	var version string
	if err := db.Get(&version, optionVersionGet); err != nil {
		fmt.Println(err)
		return false
	}

	if version == phpVersion {
		return true
	}

	var exist int
	if err := db.Get(&exist, checkMigrationTableExist); err != nil {
		fmt.Println(err)
		return false
	}

	return exist != 1
}

func createMigrationTable(db *sqlx.DB) error {
	_, err := db.Exec(migrationTableCreate)
	return err
}

func insertMigrationTableData(db *sqlx.DB) error {
	_, err := db.Exec(insertMigrateTableData)
	return err
}

const (
	phpVersion = "1.6.19"

	optionVersionGet = `
SELECT value FROM hlstats_Options WHERE keyname = 'version';
`
	checkMigrationTableExist = `SELECT 1 FROM migrations LIMIT 1;`

	migrationTableCreate = `
CREATE TABLE IF NOT EXISTS migrations (
 name VARCHAR(255)
,UNIQUE(name)
)
`
	insertMigrateTableData = `
INSERT INTO migrations (name)
VALUES ('create-table-geoLiteCity_Blocks'),
       ('create-table-geoLiteCity_Location'),
       ('create-table-hlstats-Actions'),
       ('create-table-hlstats-Awards'),
       ('create-table-hlstats-Clans'),
       ('create-table-hlstats-ClanTags'),
       ('create-table-hlstats-Countries'),
       ('create-table-hlstats-Events_Admin'),
       ('create-table-hlstats-Events_ChangeName'),
       ('create-table-hlstats-Events_ChangeRole'),
       ('create-table-hlstats-Events_ChangeTeam'),
       ('create-table-hlstats-Events_Chat'),
       ('create-table-hlstats-Events_Connects'),
       ('create-table-hlstats-Events_Disconnects'),
       ('create-table-hlstats-Events_Entries'),
       ('create-table-hlstats-Events_Frags'),
       ('create-table-hlstats-Events_Latency'),
       ('create-table-hlstats-Events_PlayerActions'),
       ('create-table-hlstats-Events_PlayerPlayerActions'),
       ('create-table-hlstats-Events_Rcon'),
       ('create-table-hlstats-Events_Statsme'),
       ('create-table-hlstats-Events_Statsme2'),
       ('create-table-hlstats-Events_StatsmeLatency'),
       ('create-table-hlstats-Events_StatsmeTime'),
       ('create-table-hlstats-Events_Suicides'),
       ('create-table-hlstats-Events_TeamBonuses'),
       ('create-table-hlstats-Events_Teamkills'),
       ('create-table-hlstats-Games'),
       ('create-table-hlstats-Games_Defaults'),
       ('create-table-hlstats-Games_Supported'),
       ('create-table-hlstats-Heatmap_Config'),
       ('create-table-hlstats-HostGroups'),
       ('create-table-hlstats-Livestats'),
       ('create-table-hlstats-Maps_Counts'),
       ('create-table-hlstats-Mods_Defaults'),
       ('create-table-hlstats-Mods_Supported'),
       ('create-table-hlstats-Options'),
       ('create-table-hlstats-Options_Choices'),
       ('create-table-hlstats-PlayerNames'),
       ('create-table-hlstats-Players'),
       ('create-table-hlstats-Players_Awards'),
       ('create-table-hlstats-Players_History'),
       ('create-table-hlstats-Players_Ribbons'),
       ('create-table-hlstats-PlayerUniqueIds'),
       ('create-table-hlstats-Ranks'),
       ('create-table-hlstats-Ribbons'),
       ('create-table-hlstats-Roles'),
       ('create-table-hlstats-Servers'),
       ('create-table-hlstats-Servers_Config'),
       ('create-table-hlstats-Servers_Config_Default'),
       ('create-table-hlstats-Servers_VoiceComm'),
       ('create-table-hlstats-server_load'),
       ('create-table-hlstats-Teams'),
       ('create-table-hlstats-Trend'),
       ('create-table-hlstats-Users'),
       ('create-table-hlstats-Weapons'),
       ('delete-from-hlstats-Ranks'),
       ('insert-into-hlstats-Actions'),
       ('insert-into-hlstats-Awards'),
       ('insert-into-hlstats-ClanTags'),
       ('insert-into-hlstats-Countries'),
       ('insert-into-hlstats-Games'),
       ('insert-into-hlstats-Games_Defaults'),
       ('insert-into-hlstats-Games_Supported'),
       ('insert-into-hlstats-Heatmap_Config'),
       ('insert-into-hlstats-Mods_Defaults'),
       ('insert-into-hlstats-Mods_Supported'),
       ('insert-into-hlstats-Options'),
       ('insert-into-hlstats-Options_Choices'),
       ('insert-into-hlstats-Ranks'),
       ('insert-into-hlstats-Ranks-nd'),
       ('insert-into-hlstats-Ribbons'),
       ('insert-into-hlstats-Roles'),
       ('insert-into-hlstats-Servers_Config_Default'),
       ('insert-into-hlstats-Teams'),
       ('insert-into-hlstats-Users'),
       ('insert-into-hlstats-Weapons'),
       ('optimize-table-hlstats-Ranks');
`
)
