package core

import (
	"time"
)

type (
	EventFrag struct {
		ID         int64     `db:"id"`         // int(10) unsigned Автоматическое приращение
		EventTime  time.Time `db:"eventTime"`  // datetime [0000-00-00 00:00:00]
		ServerID   int64     `db:"serverId"`   //int(10)  unsigned [0]
		Map        string    `db:"map"`        //	varchar(64) []
		KillerID   int64     `db:"killerId"`   //	int(10) unsigned [0]
		VictimID   int64     `db:"victimId"`   //	int(10) unsigned [0]
		Weapon     string    `db:"weapon"`     //varchar(64) []
		Headshot   string    `db:"headshot"`   //tinyint(1) [0]
		KillerRole string    `db:"killerRole"` //varchar(64) []
		VictimRole string    `db:"victimRole"` //	varchar(64) []
		//pos_x	mediumint(9) NULL
		//pos_y	mediumint(9) NULL
		//pos_z	mediumint(9) NULL
		//pos_victim_x	mediumint(9) NULL
		//pos_victim_y	mediumint(9) NULL
		//pos_victim_z	mediumint(9) NULL
	}
)
