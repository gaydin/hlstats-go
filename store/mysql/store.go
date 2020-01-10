package mysql

import (
	"fmt"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"

	"go-hlstats/store/mysql/migrations"
)

type DataStore struct {
	*sqlx.DB

	driver, config string
}

func New(config string) (*DataStore, error) {
	db, err := connect("mysql", config)
	if err != nil {
		return nil, err
	}
	db.SetConnMaxLifetime(3595 * time.Second)
	return &DataStore{
		DB:     db,
		driver: "mysql",
		config: config,
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
	if err := migrations.Migrate(db.DB); err != nil {
		return nil, fmt.Errorf("migration fail: %v", err)
	}
	return db, nil
}
