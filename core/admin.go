package core

type (
	Options struct {
		KeyName string `db:"keyname"`
		Value   string `db:"value"`
		OptType int64  `db:"opttype"`
	}
	Mod struct {
		Code string `db:"code"`
		Name string `db:"name"`
	}
)
