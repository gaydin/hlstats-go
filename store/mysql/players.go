package mysql

import (
	"database/sql"
	"fmt"
	"time"

	"go-hlstats/core"
)

type ExtendedPlayer struct {
	core.Player
	SkillChange int64           `db:"skill_change"`
	Kpd         sql.NullFloat64 `db:"kpd"`
	Hpk         sql.NullFloat64 `db:"hpk"`
	Acc         sql.NullFloat64 `db:"acc"`
	ClanName    sql.NullString  `db:"clan_name"`
}

func (db *DataStore) GetPlayersByGame(game string, limit, offset int, sort, order string) ([]*ExtendedPlayer, int64, error) {
	q := fmt.Sprintf(queryPlayersByGame, sort+" "+order)
	var players []*ExtendedPlayer
	if err := db.Select(&players, q, game, limit, offset); err != nil {
		return nil, 0, err
	}
	var total int64
	if err := db.Get(&total, "SELECT FOUND_ROWS()"); err != nil {
		return nil, 0, err
	}
	return players, total, nil
}

type ExtenderPlayerUniqueID struct {
	core.PlayerUniqueId
	CommunityId int64 `db:"communityId"`
}

func (db *DataStore) GetPlayerUniqueID(id int64) (*ExtenderPlayerUniqueID, error) {
	var playerUniqueID ExtenderPlayerUniqueID
	if err := db.Get(&playerUniqueID, queryPlayerUniqueID, id); err != nil {
		return nil, err
	}
	return &playerUniqueID, nil
}

func (db *DataStore) GetKillsPerDeathByPlayerID(id int64) (float64, error) {
	var r float64
	rows, err := db.NamedQuery(queryKillsPerDeathByPlayerID, map[string]interface{}{
		"player": id,
	})
	if err != nil {
		return 0, err
	}
	for rows.Next() {
		if err := rows.Scan(&r); err != nil {
			return 0, err
		}
	}
	return r, nil
}

func (db *DataStore) GetTotalPlayers24hByGame(game string) (int64, error) {
	var total int64
	if err := db.Get(&total, queryTotalPlayers24hByGame, game, time.Now().Unix()-86400); err != nil {
		return 0, err
	}
	return total, nil
}

func (db *DataStore) GetTotalPlayersByGame(game string) (int64, error) {
	var total int64
	if err := db.Get(&total, queryTotalPlayersByGame, game); err != nil {
		return 0, err
	}
	return total, nil
}

func (db *DataStore) GetPlayerWithClanByID(id int64) (*ExtendedPlayer, error) {
	var player ExtendedPlayer
	if err := db.Get(&player, queryPlayerWithClanByID, id); err != nil {
		return nil, err
	}
	return &player, nil
}

type FavoriteMap struct {
	Map string `db:"map"`
	Cnt int64  `db:"cnt"`
}

func (db *DataStore) GetFavoriteMapByPlayer(id int64) (*FavoriteMap, error) {
	var favoriteMap FavoriteMap
	if err := db.Get(&favoriteMap, queryFavoriteMapByPlayer, id); err != nil {
		return nil, err
	}
	return &favoriteMap, nil
}

type FavoriteWeapon struct {
	Weapon    string `db:"weapon"`
	Name      string `db:"name"`
	Kills     int64  `db:"kills"`
	Headshots int64  `db:"headshots"`
	Link      string `db:"-"`
}

func (db *DataStore) GetFavoriteWeaponByPlayer(id int64) (*FavoriteWeapon, error) {
	var favoriteWeapon FavoriteWeapon
	if err := db.Get(&favoriteWeapon, queryFavoriteWeaponByPlayer, id); err != nil {
		return nil, err
	}
	return &favoriteWeapon, nil
}

// TODO: sort by rank from options
func (db *DataStore) GetTopPlayerByGame(game string) (*core.Player, error) {
	var player core.Player
	if err := db.Get(&player, getTopPlayerByGame, game); err != nil {
		return nil, err
	}
	return &player, nil
}

const getTopPlayerByGame = `
SELECT
    playerId,
    lastName,
    activity
FROM
    hlstats_Players
WHERE
        game=?
  AND hideranking=0
ORDER BY
    skill DESC,
    (kills/IF(deaths=0,1,deaths)) DESC
LIMIT 1
`

type PlayerStatisticsSummary struct {
	Activity           int64
	Points             float64
	Rank               int64
	KillsPerMinute     float64
	KillsPerDeath      float64
	HeadshotsPerKill   float64
	ShotsPerKill       float64
	WeaponAccuracy     float64
	Headshots          int64
	Kills              int64
	Deaths             int64
	LongestKillStreak  int64
	LongestDeathStreak int64
	Suicides           int64
	TeammateKills      int64
}

//
//func (db *DataStore) GetPlayerStatisticsSummary(id int64, player *ExtendedPlayer) (*PlayerStatisticsSummary, error) {
//	db.GetPlayerWithClanByID()
//}
