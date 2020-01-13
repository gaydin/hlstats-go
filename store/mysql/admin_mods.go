package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) GetModsSupported() ([]*core.Mod, error) {
	var mods []*core.Mod
	if err := db.Select(&mods, "SELECT code, name FROM hlstats.hlstats_Mods_Supported"); err != nil {
		return nil, err
	}
	return mods, nil
}
