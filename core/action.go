package core

type (
	Action struct {
		ID           int64  `db:"id"`            //id	int(10) unsigned Автоматическое приращение
		Game         string `db:"game"`          //varchar(32) [valve]
		Code         string `db:"code"`          //varchar(64) []
		RewardPlayer int64  `db:"reward_player"` //int(11) [10]
		RewardTeam   int64  `db:"reward_team"`   //int(11) [0]
		Team         string `db:"team"`          //	team	varchar(64) []
		Description  string `db:"description"`   //	description	varchar(128) NULL
		// TODO
		//for_PlayerActions	enum('0','1') [0]
		//for_PlayerPlayerActions	enum('0','1') [0]
		//for_TeamActions	enum('0','1') [0]
		//for_WorldActions	enum('0','1') [0]
		Count int64 `db:"count"`
	}
)
