package core

type User struct {
	Username string `db:"username"`
	Password string `db:"password"`
	AccLevel int64  `db:"acclevel"`
	PlayerID int64  `db:"playerId"`
}
