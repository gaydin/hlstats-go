package mysql

import (
	"go-hlstats/core"
)

func (db *DataStore) GetUser(username string) (*core.User, error) {
	var user core.User
	err := db.Get(&user, queryUserByLogin, username)
	if err != nil {
		return nil, err
	}
	return &user, nil
}

func (db *DataStore) GetUsers() ([]*core.User, error) {
	var users []*core.User
	if err := db.Select(&users, "SELECT username, acclevel FROM hlstats_Users ORDER BY username"); err != nil {
		return nil, err
	}
	return users, nil
}

func (db *DataStore) CreateUser(user *core.User) error {
	_, err := db.Exec("INSERT INTO hlstats_Users (username,password,acclevel) VALUES (?, ?,?)", user.Username, user.Password, user.AccLevel)
	return err
}

func (db *DataStore) UpdateUser(username string, user *core.User) error {
	_, err := db.Exec("UPDATE hlstats_Users SET username=?, password=?,acclevel=? WHERE username = ?", user.Username, user.Password, user.AccLevel, username)
	return err
}
func (db *DataStore) DeleteUser(username string) error {
	_, err := db.Exec("DELETE FROM hlstats_Users WHERE username=?", username)
	return err
}
