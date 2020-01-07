package mysql

import (
	"database/sql"
	"fmt"

	"go-hlstats/core"
)

func (db *DataStore) GetRealMapKillsAndHeadshots(game string) (*RealKillsAndHeadshots, error) {
	var r RealKillsAndHeadshots
	if err := db.Get(&r, queryMapsRealKillsAndHeadshots, game); err != nil {
		return nil, err
	}
	return &r, nil
}

type ExtendedMap struct {
	core.Map
	Kpercent sql.NullFloat64 `db:"kpercent"`
	HPK      sql.NullFloat64 `db:"hpk"`
	Hpercent sql.NullFloat64 `db:"hpercent"`
}

func (db *DataStore) GetMaps(game string, realHeadshots, realKills int64, sort, order string) ([]*ExtendedMap, error) {
	var maps []*ExtendedMap
	if realHeadshots == 0 {
		realHeadshots = 1
	}
	if realKills == 0 {
		realKills = 1
	}
	q := fmt.Sprintf(queryMaps, sort+" "+order)
	err := db.Select(&maps, q, realKills, realHeadshots, game)
	if err != nil {
		return nil, err
	}
	return maps, nil
}
