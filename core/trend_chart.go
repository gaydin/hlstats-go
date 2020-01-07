package core

type (
	ChartData struct {
		Labels   []interface{}   `json:"labels"`
		Datasets []*ChartDataset `json:"datasets"`
	}

	ChartDataset struct {
		Label           string        `json:"label"`
		Fill            bool          `json:"fill"`
		Data            []interface{} `json:"data"`
		BackgroundColor string        `json:"backgroundColor"`
		BorderColor     string        `json:"borderColor"`
		YAxisID         string        `json:"yAxisID"`
	}

	SkillChange struct {
		TS          int64 `db:"ts"`
		Skill       int64 `db:"skill"`
		SkillChange int64 `db:"skill_change"`
	}
)
