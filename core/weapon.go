package core

type (
	Weapon struct {
		WeaponID  int64   `db:"weaponId"`
		Game      string  `db:"game"`
		Code      string  `db:"code"`
		Weapon    string  `db:"weapon"`
		Name      string  `db:"name"`
		Modifier  float64 `db:"modifier"`
		Kills     int64   `db:"kills"`
		Headshots int64   `db:"headshots"`
	}
)
