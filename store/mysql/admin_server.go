package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) AddNewServer(gameMod, realGame, hlstatsPath string, server *core.Server) error {
	tx, err := db.Begin()
	if err != nil {
		return err
	}

	res, err := tx.Exec("INSERT INTO hlstats_Servers (address, port, name, game, publicaddress, rcon_password) VALUES (?,?,?,?,?,?)",
		server.Address,
		server.Port,
		server.Name,
		server.Game,
		server.PublicAddress,
		server.RconPassword,
	)
	if err != nil {
		tx.Rollback()
		return err
	}

	lastInsertID, err := res.LastInsertId()
	if err != nil {
		return err
	}

	_, err = tx.Exec("INSERT INTO hlstats_Servers_Config (serverId, parameter, value) SELECT ?, parameter, value FROM hlstats_Mods_Defaults WHERE code = ?", lastInsertID, gameMod)
	if err != nil {
		tx.Rollback()
		return err
	}

	_, err = tx.Exec("INSERT INTO hlstats_Servers_Config (serverId, parameter, value) VALUES (?, 'Mod', ?)", lastInsertID, gameMod)
	if err != nil {
		tx.Rollback()
		return err
	}

	_, err = tx.Exec("INSERT INTO hlstats_Servers_Config (serverId, parameter, value) SELECT ?, parameter, value FROM hlstats_Games_Defaults WHERE code = ? ON DUPLICATE KEY UPDATE value = VALUES(value);", lastInsertID, realGame)
	if err != nil {
		tx.Rollback()
		return err
	}
	_, err = tx.Exec("UPDATE hlstats_Servers_Config SET value = ? WHERE serverId = ? AND parameter = 'HLStatsURL'", hlstatsPath, lastInsertID)
	if err != nil {
		tx.Rollback()
		return err
	}

	return tx.Commit()
}
