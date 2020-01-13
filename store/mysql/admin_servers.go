package mysql

import (
	"go-hlstats/core"
)

const selectAdminServers = `
		SELECT
			serverId,
			address,
			port,
			name,
			sortorder,
			publicaddress,
			game
		FROM
			hlstats_Servers
		WHERE
			game=?
		ORDER BY
			address ASC,
			port ASC
`

func (db *DataStore) GetAdminServers(gameCode string) ([]*core.Server, error) {
	var servers []*core.Server
	if err := db.Select(&servers, selectAdminServers, gameCode); err != nil {
		return nil, err
	}
	return servers, nil
}

func (db *DataStore) UpdateAdminServer(server *core.Server) error {
	_, err := db.Exec("UPDATE hlstats.hlstats_Servers SET address=?,port=?,name=?,publicaddress=?,game=?,sortorder=? WHERE serverId = ?",
		server.Address,
		server.Port,
		server.Name,
		server.PublicAddress,
		server.Game,
		server.SortOrder,
		server.ServerID,
	)
	if err != nil {
		return err
	}
	if server.RconPassword != "" {
		_, err := db.Exec("UPDATE hlstats.hlstats_Servers SET rcon_password=? WHERE serverId = ?",
			server.RconPassword,
			server.ServerID,
		)
		if err != nil {
			return err
		}
	}
	return nil
}
