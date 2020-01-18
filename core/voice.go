package core

import (
	"database/sql"
)

type VoiceServer struct {
	ID        int64          `db:"serverId"`
	Addr      string         `db:"addr"`
	Type      int64          `db:"serverType"`
	Descr     sql.NullString `db:"descr"`
	Name      string         `db:"name"`
	Password  sql.NullString `db:"password"`
	UDPPort   int64          `db:"UDPPort"`
	QueryPort int64          `db:"queryPort"`
}
