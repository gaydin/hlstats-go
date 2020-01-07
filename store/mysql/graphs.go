package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) GetSkillChangeByPlayer(player int64) ([]*core.SkillChange, error) {
	var changes []*core.SkillChange
	if err := db.Select(&changes, querySkillChangeByPlayer, player); err != nil {
		return nil, err
	}
	return changes, nil
}
