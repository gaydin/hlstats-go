package core

type (
	Options struct {
		KeyName string `db:"keyname"`
		Value   string `db:"value"`
		OptType int64  `db:"opttype"`
	}
)
