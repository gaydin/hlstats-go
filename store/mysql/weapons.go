package mysql

import (
	"database/sql"
	"fmt"

	"go-hlstats/core"
)

type RealKillsAndHeadshots struct {
	Kills     int64 `db:"kills"`
	Headshots int64 `db:"headshots"`
}

func (db *DataStore) GetRealWeaponsKillsAndHeadshots(game string) (*RealKillsAndHeadshots, error) {
	var r RealKillsAndHeadshots
	if err := db.Get(&r, queryWeaponsRealKillsAndHeadshots, game); err != nil {
		return nil, err
	}
	return &r, nil
}

type ExtendedWeapon struct {
	core.Weapon
	Kpercent sql.NullFloat64 `db:"kpercent"`
	HPK      sql.NullFloat64 `db:"hpk"`
	Hpercent sql.NullFloat64 `db:"hpercent"`
}

func (db *DataStore) GetWeapons(game string, realHeadshots, realKills int64, sort, order string) ([]*ExtendedWeapon, error) {
	var weapons []*ExtendedWeapon
	if realHeadshots == 0 {
		realHeadshots = 1
	}
	if realKills == 0 {
		realKills = 1
	}
	q := fmt.Sprintf(queryWeapons, sort+" "+order)
	err := db.Select(&weapons, q, realKills, realHeadshots, game)
	if err != nil {
		return nil, err
	}
	return weapons, nil
}
