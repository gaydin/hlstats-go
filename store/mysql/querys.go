package mysql

const (
	queryServersByGame = `
			SELECT
                serverId,
                name,
                IF(publicaddress != '',
                    publicaddress,
                    concat(address, ':', port)
                ) AS addr,
                kills,
                headshots,              
                act_players,                                
                max_players,
                act_map,
                map_started,
                map_ct_wins,
                map_ts_wins                 
            FROM
                hlstats_servers
            WHERE
                game=?
            ORDER BY
                sortorder, name, serverId
`

	queryUserByLogin = `
				SELECT
					*
				FROM
					hlstats_users
				WHERE
					username=?
				LIMIT 1
`

	// TODO: order by, $minEvent, $maxEvent
	queryPlayersByGame = `
	SELECT
		SQL_CALC_FOUND_ROWS
		hlstats_players.playerId,
		hlstats_players.connection_time,
		unhex(replace(hex(hlstats_players.lastName), 'E280AE', '')) as lastName,
		hlstats_players.flag,
		hlstats_players.country,
		hlstats_players.skill,
		hlstats_players.kills,
		hlstats_players.deaths,
		hlstats_players.last_skill_change,
		ROUND(hlstats_players.kills/(IF(hlstats_players.deaths=0, 1, hlstats_players.deaths)), 2) AS kpd,
		hlstats_players.headshots,
		ROUND(hlstats_players.headshots/(IF(hlstats_players.kills=0, 1, hlstats_players.kills)), 2) AS hpk,
		IFNULL(ROUND((hlstats_players.hits / hlstats_players.shots * 100), 1), 0) AS acc,
		activity
	FROM
		hlstats_players
	WHERE
		hlstats_players.game = ?
		AND hlstats_players.hideranking = 0
		AND hlstats_players.kills >= 1
	ORDER BY
		%s,
		kpd desc,
		hlstats_players.lastName ASC
	LIMIT ?, ?
`
	queryPlayerUniqueID = `
	SELECT
		*,
		CAST(LEFT(hlstats_playeruniqueids.uniqueId,1) AS unsigned) + CAST('76561197960265728' AS unsigned) + CAST(MID(hlstats_playeruniqueids.uniqueId, 3,10)*2 AS unsigned) AS communityId
	FROM
		hlstats_playeruniqueids
	WHERE
		hlstats_playeruniqueids.playerId = ?
`

	queryKillsPerDeathByPlayerID = `
	SELECT
		IFNULL(ROUND(SUM(hlstats_events_frags.killerId = :player) / IF(SUM(hlstats_events_frags.victimId = :player) = 0, 1, SUM(hlstats_events_frags.victimId = :player)), 2), '-')
	FROM
		hlstats_events_frags
	WHERE
		(
			hlstats_events_frags.killerId = :player
			OR hlstats_events_frags.victimId = :player
		)
`

	queryPlayerDataByPlayerID = `
	SELECT
		IFNULL(ROUND((SUM(tats_events_Statsme.hits) / SUM(tats_events_Statsme.shots) * 100), 2), 0.0) AS accuracy,
		SUM(tats_events_Statsme.shots) AS shots,
		SUM(tats_events_Statsme.hits) AS hits,
		SUM(tats_events_Statsme.kills) AS kills
	FROM
		tats_events_Statsme
	WHERE
		tats_events_Statsme.playerId='$player'
`

	queryPlayerWithClanByID = `
	SELECT
		hlstats_players.playerId,
		hlstats_players.connection_time,
		unhex(replace(hex(hlstats_players.lastName), 'E280AE', '')) as lastName,
		hlstats_players.country,
		hlstats_players.city,
		hlstats_players.flag,
		hlstats_players.clan,
		hlstats_players.fullName,
		hlstats_players.email,
		hlstats_players.homepage,
		hlstats_players.icq,
		hlstats_players.game,
		hlstats_players.hideranking,
		hlstats_players.blockavatar,
		hlstats_players.skill,
		hlstats_players.kills,
		hlstats_players.deaths,
		IFNULL(kills / deaths, '-') AS kpd,
		hlstats_players.suicides,
		hlstats_players.headshots,
		IFNULL(headshots / kills, '-') AS hpk,
		hlstats_players.shots,
		hlstats_players.hits,
		hlstats_players.teamkills,
		IFNULL(ROUND((hits / shots * 100), 1), 0) AS acc,
		CONCAT(hlstats_clans.name) AS clan_name,
		activity
	FROM
		hlstats_players
	LEFT JOIN
		hlstats_clans
	ON
		hlstats_clans.clanId = hlstats_players.clan
	WHERE
		hlstats_players.playerId = ?
	LIMIT
		1
`

	queryFavoriteMapByPlayer = `
	SELECT
		hlstats_events_entries.map,
		COUNT(map) AS cnt
	FROM
			hlstats_events_entries
	WHERE
			hlstats_events_entries.playerId = ?
	GROUP BY
			hlstats_events_entries.map
	ORDER BY
			cnt DESC
	LIMIT
		1
`
	queryFavoriteWeaponByPlayer = `
	SELECT
		hlstats_events_frags.weapon,
		hlstats_weapons.name,
		COUNT(hlstats_events_frags.weapon) AS kills,
		SUM(hlstats_events_frags.headshot=1) as headshots
	FROM
		hlstats_events_frags
	LEFT JOIN
		hlstats_weapons
	ON
		hlstats_weapons.code = hlstats_events_frags.weapon
	WHERE
		hlstats_events_frags.killerId=?
	GROUP BY
		hlstats_events_frags.weapon,
		hlstats_weapons.weaponid
	ORDER BY
		kills desc, headshots desc
	LIMIT
		1
`
	queryGames = `
	SELECT
		code,
		name
	FROM
		hlstats_games
	WHERE
		hidden='0'
	ORDER BY
		realgame, name ASC
`
	queryWeaponsRealKillsAndHeadshots = `
	SELECT
		IF(IFNULL(SUM(hlstats_weapons.kills), 0) = 0, 1, SUM(hlstats_weapons.kills)) AS kills,
		IF(IFNULL(SUM(hlstats_weapons.headshots), 0) = 0, 1, SUM(hlstats_weapons.headshots)) AS headshots
	FROM
		hlstats_weapons
	WHERE
		hlstats_weapons.game = ?
`

	queryMapsRealKillsAndHeadshots = `
	SELECT
		SUM(hlstats_maps_counts.kills) AS kills,
		SUM(hlstats_maps_counts.headshots)  AS headshots
	FROM
		hlstats_maps_counts
	WHERE
		hlstats_maps_counts.game = ?
`

	queryWeapons = `
	SELECT
		hlstats_weapons.code AS weapon,		
		hlstats_weapons.name,
		hlstats_weapons.kills, 
		ROUND(hlstats_weapons.kills / ? * 100, 2) AS kpercent,
		hlstats_weapons.headshots,
		ROUND(hlstats_weapons.headshots / IF(hlstats_weapons.kills = 0, 1, hlstats_weapons.kills), 2) AS hpk,
		ROUND(hlstats_weapons.headshots / ? * 100, 2) AS hpercent,
		hlstats_weapons.modifier
	FROM
		hlstats_weapons
	WHERE
		hlstats_weapons.game = ?
		AND hlstats_weapons.kills > 0 
	GROUP BY
		hlstats_weapons.weaponId
	ORDER BY
		%s,
		weapon desc
`

	queryGameByCode = `
	SELECT
		hlstats_games.name
	FROM
		hlstats_games
	WHERE
		hlstats_games.code = ?
`

	queryActionsByGame = `
	SELECT
		hlstats_actions.code,
		hlstats_actions.description,
		hlstats_actions.count,
		hlstats_actions.reward_player
	FROM
		hlstats_actions
	WHERE
		hlstats_actions.game = ?
		AND hlstats_actions.count > 0
	GROUP BY
		hlstats_actions.id
	ORDER BY
		count desc, 
		description desc

`

	querySkillChangeByPlayer = `
	SELECT UNIX_TIMESTAMP(eventTime) AS ts, skill, skill_change FROM hlstats_players_history WHERE playerId = ? ORDER BY eventTime DESC LIMIT 30
`

	queryTotalPlayers24hByGame = `
			SELECT 
				players 
			FROM 
				hlstats_trend 
			WHERE       
				game=?
				AND timestamp<=?
			ORDER BY 
				timestamp DESC LIMIT 0,1
`

	queryTotalPlayersByGame = `
	SELECT
		count(*)
	FROM
		hlstats_players
	WHERE 
		game=?
`

	queryGameGetTotalStatsByGame = `
	SELECT
		SUM(kills) AS count_kills,
		SUM(headshots) AS count_headshots,
		count(serverId)	AS count_servers	
	FROM
		hlstats_servers
	WHERE 
		game=?
`

	queryMapKillsAndHeadshotsByGame = `
	 	SELECT
		SUM(hlstats_maps_counts.kills) AS count_kills,
		SUM(hlstats_maps_counts.headshots) AS count_headshots
	FROM
		hlstats_maps_counts
	WHERE
		hlstats_maps_counts.game = ?
`

	queryMaps = `
	SELECT
		IF(hlstats_maps_counts.map = '', '(Unaccounted)', hlstats_maps_counts.map) AS map,
		hlstats_maps_counts.kills,
		ROUND(kills / ? * 100, 2) AS kpercent,
		hlstats_maps_counts.headshots,
		ROUND(hlstats_maps_counts.headshots / IF(hlstats_maps_counts.kills = 0, 1, hlstats_maps_counts.kills), 2) AS hpk,
		ROUND(hlstats_maps_counts.headshots / ? * 100, 2) AS hpercent
	FROM
		hlstats_maps_counts
	WHERE
		hlstats_maps_counts.game = ?
	ORDER BY
		%s,
		map asc
`
	queryMapEventsFragsAndPlayers = `
	SELECT
		hlstats_events_frags.killerId,
		hlstats_players.lastName,
		hlstats_players.flag as flag,
		COUNT(hlstats_events_frags.map) AS frags,
		SUM(hlstats_events_frags.headshot=1) as headshots,
		IFNULL(SUM(hlstats_events_frags.headshot=1) / Count(hlstats_events_frags.map), '-') AS hpk
	FROM
		hlstats_events_frags,
		hlstats_players	
	WHERE
		hlstats_players.playerId = hlstats_events_frags.killerId
		AND hlstats_events_frags.map=?
		AND hlstats_players.game=?
		AND hlstats_players.hideranking<>'1'
	GROUP BY
		hlstats_events_frags.killerId
`

	queryMapTotalKills = `
	SELECT
		COUNT(DISTINCT hlstats_events_frags.killerId),
		SUM(hlstats_events_frags.map='$map')
	FROM
		hlstats_events_frags,
	  hlstats_servers
	WHERE
		hlstats_servers.serverId = hlstats_events_frags.serverId
		AND hlstats_events_frags.map='$map'
		AND hlstats_servers.game='$game'
`
)
