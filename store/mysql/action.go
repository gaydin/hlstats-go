package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) GetActionsByGame(game string) ([]*core.Action, error) {
	var actions []*core.Action
	err := db.Select(&actions, queryActionsByGame, game)
	if err != nil {
		return nil, err
	}
	return actions, nil
}
