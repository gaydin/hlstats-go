package mysql

import (
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
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
	//if err := migration(driver, db); err != nil {
	//	return nil, fmt.Errorf("migration fail: %v", err)
	//}
	return db, nil
}

//func migration(driver string, db *sqlx.DB) error {
//	migrate.SetTable("migrations")
//	migrations := &migrate.FileMigrationSource{
//		Dir: "./migrations",
//	}
//	n, err := migrate.Exec(db.DB, driver, migrations, migrate.Up)
//	if err != nil {
//		return err
//	}
//	if n != 0 {
//		fmt.Printf("Applied %d migrations!\n", n)
//	}
//	return nil
//}
