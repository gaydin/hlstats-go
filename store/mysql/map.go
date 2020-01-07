package mysql

import (
	"go-hlstats/core"
)

type FragsAndPlayers struct {
	core.Player
	core.EventFrag
	Frags int64   `db:"frags"`
	HPK   float64 `db:"hpk"`
}

func (db *DataStore) GetMapEventsFragsAndPlayers(gameMap, game string) ([]*FragsAndPlayers, error) {
	var resp []*FragsAndPlayers
	if err := db.Select(&resp, queryMapEventsFragsAndPlayers, gameMap, game); err != nil {
		return nil, err
	}
	return resp, nil
}
