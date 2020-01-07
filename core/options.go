package core

type (
	Option struct {
		Key        string `db:"keyname"`
		Value      string `db:"value"`
		OptionType int64  `db:"opttype"`
	}
)
