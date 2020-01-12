package mysql

import (
	"go-hlstats/core"
)

type ExtendedServer struct {
	core.Server
	Addr string `db:"addr"`
}

func (db *DataStore) GetServerByGame(game string) ([]*ExtendedServer, error) {
	var servers []*ExtendedServer
	if err := db.Select(&servers, queryServersByGame, game); err != nil {
		return nil, err
	}
	return servers, nil
}

// TODO: hidden
func (db *DataStore) GetGames(hidden bool) ([]*core.Game, error) {
	var games []*core.Game
	if hidden {
		if err := db.Select(&games, queryGames); err != nil {
			return nil, err
		}
	} else {
		if err := db.Select(&games, queryGamesHidden); err != nil {
			return nil, err
		}
	}

	return games, nil
}

func (db *DataStore) GetGameByCode(code string) (*core.Game, error) {
	var game core.Game
	if err := db.Get(&game, queryGameByCode, code); err != nil {
		return nil, err
	}
	return &game, nil
}

type TotalStats struct {
	Kills     int64 `db:"count_kills"`
	Headshots int64 `db:"count_headshots"`
	Servers   int64 `db:"count_servers"`
}

func (db *DataStore) GetGameGetTotalStatsByGame(code string) (*TotalStats, error) {
	var total TotalStats
	if err := db.Get(&total, queryGameGetTotalStatsByGame, code); err != nil {
		return nil, err
	}
	return &total, nil
}
