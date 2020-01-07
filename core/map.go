package core

type (
	Map struct {
		RowId     int64  `db:"rowId"`
		Game      string `db:"game"`
		Name      string `db:"map"`
		Kills     int64  `db:"kills"`
		Headshots int64  `db:"headshots"`
	}
)
