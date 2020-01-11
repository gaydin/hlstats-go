package core

type (
	Option struct {
		Key        string `db:"keyname"`
		Value      string `db:"value"`
		OptionType int64  `db:"opttype"`

		Type          string
		OptionChoices []*OptionChoices
	}

	OptionChoices struct {
		Text  string `db:"text"`
		Value string `db:"value"`
	}
)
