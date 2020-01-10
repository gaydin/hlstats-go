package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) GetUserLogin(login string) (*core.User, error) {
	var user core.User
	err := db.Get(&user, queryUserByLogin, login)
	if err != nil {
		return nil, err
	}
	return &user, nil
}
