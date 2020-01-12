package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) GetSupportedGames() ([]*core.SupportedGame, error) {
	var games []*core.SupportedGame
	if err := db.Select(&games, "SELECT code,name FROM hlstats_Games_Supported"); err != nil {
		return nil, err
	}
	return games, nil
}

func (db *DataStore) UpdateGame(code string, hidden string, game *core.Game) error {
	_, err := db.Exec("UPDATE hlstats_Games SET name=?,hidden=?,realgame=? WHERE code = ?", game.Name, hidden, game.RealGame, code)
	return err
}
