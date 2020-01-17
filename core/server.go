package core

import (
	"database/sql"
)

type (
	Server struct {
		ServerID      int64   `db:"serverId"`
		Address       string  `db:"address"`
		Port          int64   `db:"port"`
		Name          string  `db:"name"`
		SortOrder     int64   `db:"sortorder"`
		Game          string  `db:"game"`
		PublicAddress string  `db:"publicaddress"`
		StatusUrl     string  `db:"statusurl"`
		RconPassword  string  `db:"rcon_password"`
		Kills         int64   `db:"kills"`
		Players       int64   `db:"players"`
		Rounds        int64   `db:"rounds"`
		Suicides      int64   `db:"suicides"`
		HeadShots     int64   `db:"headshots"`
		BombsPlanted  int64   `db:"bombs_planted"`
		BombsDefused  int64   `db:"bombs_defused"`
		CtWins        int64   `db:"ct_wins"`
		TsWins        int64   `db:"ts_wins"`
		ActPlayers    int64   `db:"act_players"`
		MaxPlayers    int64   `db:"max_players"`
		ActMap        string  `db:"act_map"`
		MapRounds     int64   `db:"map_rounds"`
		MapCtWins     int64   `db:"map_ct_wins"`
		MapTsWins     int64   `db:"map_ts_wins"`
		MapStarted    int64   `db:"map_started"`
		MapChanges    int64   `db:"map_changes"`
		CtShots       int64   `db:"ct_shots"`
		CtHits        int64   `db:"ct_hits"`
		TsShots       int64   `db:"ts_shots"`
		TsHits        int64   `db:"ts_hits"`
		MapCtShots    int64   `db:"map_ct_shots"`
		MapCtHits     int64   `db:"map_ct_hits"`
		MapTsShots    int64   `db:"map_ts_shots"`
		MapTsHits     int64   `db:"map_ts_hits"`
		Lat           float64 `db:"lat"`
		Lng           float64 `db:"lng"`
		City          string  `db:"city"`
		Country       string  `db:"country"`
		LastEvent     int64   `db:"last_event"`
	}

	ServerOnline struct {
		Actual  sql.NullInt64
		Maximum sql.NullInt64
	}
)
