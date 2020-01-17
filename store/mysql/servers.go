package mysql

import (
	"go-hlstats/core"
)

const onlineByGameQuery = `
SELECT
	SUM(act_players) AS actual,
	SUM(max_players) AS maximum
FROM
	hlstats_Servers
WHERE
	hlstats_Servers.game=?
`

func (db *DataStore) GetOnlineByGame(name string) (*core.ServerOnline, error) {
	var online core.ServerOnline
	err := db.Get(&online, onlineByGameQuery, name)
	if err != nil {
		return nil, err
	}

	return &online, nil
}
