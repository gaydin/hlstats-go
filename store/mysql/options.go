package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) GetOptions() (map[string]string, error) {
	var options []*core.Option
	err := db.Select(&options, "SELECT `keyname`,`value` FROM hlstats_Options WHERE opttype >= 1")
	if err != nil {
		return nil, err
	}
	optMap := make(map[string]string)
	for i := range options {
		optMap[options[i].Key] = options[i].Value
	}
	return optMap, nil
}
