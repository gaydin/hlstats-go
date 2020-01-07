package core

type (
	Game struct {
		Code     string `db:"code"`
		Name     string `db:"name"`
		Hidden   int64  `db:"hidden"`
		RealGame string `db:"realgame"`
	}
)
