package mysql

import (
	"go-hlstats/core"
)

const getClanTagsQuery = `
SELECT
	id,
	pattern,
	position
FROM
	hlstats_ClanTags
ORDER BY
	id
`

func (db *DataStore) GetClanTags() ([]*core.ClanTag, error) {
	var clanTags []*core.ClanTag
	if err := db.Select(&clanTags, getClanTagsQuery); err != nil {
		return nil, err
	}
	return clanTags, nil
}

func (db *DataStore) CreateClanTag(voiceServer *core.VoiceServer) error {
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

func (db *DataStore) UpdateClanTag(id int64, voiceServer *core.VoiceServer) error {
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

func (db *DataStore) DeleteClanTag(id int64) error {
	_, err := db.Exec("DELETE FROM hlstats_Servers_VoiceComm WHERE serverId = ?", id)
	return err
}
