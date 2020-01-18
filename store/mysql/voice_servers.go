package mysql

import (
	"go-hlstats/core"
)

const getVoiceServersQuery = `
SELECT
	serverId,
	name,
	addr,
	password,
	UDPPort,
	queryPort,
	descr,
	serverType
FROM
	hlstats.hlstats_Servers_VoiceComm
ORDER BY
	serverType,
	name`

func (db *DataStore) GetVoiceServers() ([]*core.VoiceServer, error) {
	var players []*core.VoiceServer
	if err := db.Select(&players, getVoiceServersQuery); err != nil {
		return nil, err
	}
	return players, nil
}

func (db *DataStore) CreateVoiceServer(voiceServer *core.VoiceServer) error {
	_, err := db.Exec(
		"INSERT INTO hlstats_Servers_VoiceComm (name,addr,password,descr,queryPort,UDPPort,serverType) VALUES (?,?,?,?,?,?,?)",
		voiceServer.Name,
		voiceServer.Addr,
		voiceServer.Password.String,
		voiceServer.Descr.String,
		voiceServer.QueryPort,
		voiceServer.UDPPort,
		voiceServer.Type,
	)
	return err
}

func (db *DataStore) UpdateVoiceServer(id int64, voiceServer *core.VoiceServer) error {
	_, err := db.Exec(
		"UPDATE hlstats_Servers_VoiceComm SET name=?,addr=?,password=?,descr=?,queryPort=?,UDPPort=?,serverType=? WHERE serverId = ?",
		voiceServer.Name,
		voiceServer.Addr,
		voiceServer.Password.String,
		voiceServer.Descr.String,
		voiceServer.QueryPort,
		voiceServer.UDPPort,
		voiceServer.Type,
		id,
	)
	return err
}

func (db *DataStore) DeleteVoiceServer(id int64) error {
	_, err := db.Exec("DELETE FROM hlstats_Servers_VoiceComm WHERE serverId = ?", id)
	return err
}
