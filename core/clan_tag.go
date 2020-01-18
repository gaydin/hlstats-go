package core

type ClanTag struct {
	ID       int64  `db:"id"`
	Pattern  string `db:"pattern"`
	Position string `db:"position"`
}
