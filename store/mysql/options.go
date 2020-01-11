package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) GetOptionByName(name string) (*core.Option, error) {
	var option core.Option
	err := db.Get(&option, "SELECT value FROM hlstats_Options WHERE keyname=?", name)
	if err != nil {
		return nil, err
	}

	return &option, nil
}

func (db *DataStore) UpdateOption(name, value string) error {
	_, err := db.Exec("UPDATE hlstats_Options SET value=? WHERE keyname = ?", value, name)
	return err
}

func (db *DataStore) InsertOption(option *core.Option) error {
	_, err := db.Exec("INSERT INTO hlstats_Options (keyname,value) VALUES (?, ?)", option.Key, option.Value)
	return err
}

func (db *DataStore) GetOptions() (map[string]*core.Option, error) {
	var options []*core.Option
	err := db.Select(&options, "SELECT keyname,value FROM hlstats_Options")
	if err != nil {
		return nil, err
	}

	optMap := make(map[string]*core.Option)
	for i := range options {
		optMap[options[i].Key] = options[i]
	}
	return optMap, nil
}

func (db *DataStore) GetOptionsChoices(key string) ([]*core.OptionChoices, error) {
	var options []*core.OptionChoices
	err := db.Select(&options, "SELECT value,text FROM hlstats_Options_Choices WHERE keyname=? ORDER BY isDefault desc", key)
	if err != nil {
		return nil, err
	}
	return options, nil
}
