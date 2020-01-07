package core

import (
	"database/sql"
)

type (
	Player struct {
		ID              int64          `db:"playerId"`
		LastEvent       int64          `db:"last_event"`
		ConnectionTime  int64          `db:"connection_time"`
		LastName        string         `db:"lastName"`
		LastAddress     string         `db:"lastAddress"`
		City            string         `db:"city"`
		State           string         `db:"state"`
		Country         string         `db:"country"`
		Flag            string         `db:"flag"`
		Lat             float64        `db:"lat"`
		Lng             float64        `db:"lng"`
		Clan            int64          `db:"clan"`
		Kills           int64          `db:"kills"`
		Deaths          int64          `db:"deaths"`
		Suicides        int64          `db:"suicides"`
		Skill           int64          `db:"skill"`
		Shots           int64          `db:"shots"`
		Hits            int64          `db:"hits"`
		TeamKills       int64          `db:"teamkills"`
		FullName        sql.NullString `db:"fullName"`
		Email           sql.NullString `db:"email"`
		Homepage        sql.NullString `db:"homepage"`
		Icq             sql.NullInt64  `db:"icq"`
		Game            string         `db:"game"`
		HideRanking     int64          `db:"hideranking"`
		HeadShots       int64          `db:"headshots"`
		LastSkillChange int64          `db:"last_skill_change"`
		DisplayEvents   int64          `db:"displayEvents"`
		KillStreak      int64          `db:"kill_streak"`
		DeathStreak     int64          `db:"death_streak"`
		BlockAvatar     int64          `db:"blockavatar"`
		Activity        int64          `db:"activity"`
		CreateDate      int64          `db:"createdate"`
	}

	PlayerUniqueId struct {
		PlayerID int64        `db:"playerId"`
		UniqueID string       `db:"uniqueId"`
		Game     string       `db:"game"`
		Merge    sql.NullBool `db:"merge"`
	}
)
