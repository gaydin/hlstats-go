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
                hlstats_Servers
            WHERE
                game=?
            ORDER BY
                sortorder, name, serverId
`
	queryUserByLogin = `
				SELECT
					*
				FROM
					hlstats_Users
				WHERE
					username=?
				LIMIT 1
`

	// TODO: order by, $minEvent, $maxEvent
	queryPlayersByGame = `
	SELECT
		SQL_CALC_FOUND_ROWS
		hlstats_Players.playerId,
		hlstats_Players.connection_time,
		unhex(replace(hex(hlstats_Players.lastName), 'E280AE', '')) as lastName,
		hlstats_Players.flag,
		hlstats_Players.country,
		hlstats_Players.skill,
		hlstats_Players.kills,
		hlstats_Players.deaths,
		hlstats_Players.last_skill_change,
		ROUND(hlstats_Players.kills/(IF(hlstats_Players.deaths=0, 1, hlstats_Players.deaths)), 2) AS kpd,
		hlstats_Players.headshots,
		ROUND(hlstats_Players.headshots/(IF(hlstats_Players.kills=0, 1, hlstats_Players.kills)), 2) AS hpk,
		IFNULL(ROUND((hlstats_Players.hits / hlstats_Players.shots * 100), 1), 0) AS acc,
		activity
	FROM
		hlstats_Players
	WHERE
		hlstats_Players.game = ?
		AND hlstats_Players.hideranking = 0
		AND hlstats_Players.kills >= 1
	ORDER BY
		%s,
		kpd desc,
		hlstats_Players.lastName ASC
	LIMIT ?, ?
`
	queryPlayerUniqueID = `
	SELECT
		*,
		CAST(LEFT(hlstats_PlayerUniqueIds.uniqueId,1) AS unsigned) + CAST('76561197960265728' AS unsigned) + CAST(MID(hlstats_PlayerUniqueIds.uniqueId, 3,10)*2 AS unsigned) AS communityId
	FROM
		hlstats_PlayerUniqueIds
	WHERE
		hlstats_PlayerUniqueIds.playerId = ?
`

	queryKillsPerDeathByPlayerID = `
	SELECT
		IFNULL(ROUND(SUM(hlstats_Events_Frags.killerId = :player) / IF(SUM(hlstats_Events_Frags.victimId = :player) = 0, 1, SUM(hlstats_Events_Frags.victimId = :player)), 2), '-')
	FROM
		hlstats_Events_Frags
	WHERE
		(
			hlstats_Events_Frags.killerId = :player
			OR hlstats_Events_Frags.victimId = :player
		)
`

	queryPlayerDataByPlayerID = `
	SELECT
		IFNULL(ROUND((SUM(hlstats_Events_Statsme.hits) / SUM(hlstats_Events_Statsme.shots) * 100), 2), 0.0) AS accuracy,
		SUM(hlstats_Events_Statsme.shots) AS shots,
		SUM(hlstats_Events_Statsme.hits) AS hits,
		SUM(hlstats_Events_Statsme.kills) AS kills
	FROM
		hlstats_Events_Statsme
	WHERE
		hlstats_Events_Statsme.playerId='$player'
`

	queryPlayerWithClanByID = `
	SELECT
		hlstats_Players.playerId,
		hlstats_Players.connection_time,
		unhex(replace(hex(hlstats_Players.lastName), 'E280AE', '')) as lastName,
		hlstats_Players.country,
		hlstats_Players.city,
		hlstats_Players.flag,
		hlstats_Players.clan,
		hlstats_Players.fullName,
		hlstats_Players.email,
		hlstats_Players.homepage,
		hlstats_Players.icq,
		hlstats_Players.game,
		hlstats_Players.hideranking,
		hlstats_Players.blockavatar,
		hlstats_Players.skill,
		hlstats_Players.kills,
		hlstats_Players.deaths,
		IFNULL(kills / deaths, '-') AS kpd,
		hlstats_Players.suicides,
		hlstats_Players.headshots,
		IFNULL(headshots / kills, '-') AS hpk,
		hlstats_Players.shots,
		hlstats_Players.hits,
		hlstats_Players.teamkills,
		IFNULL(ROUND((hits / shots * 100), 1), 0) AS acc,
		CONCAT(hlstats_Clans.name) AS clan_name,
		activity
	FROM
		hlstats_Players
	LEFT JOIN
		hlstats_Clans
	ON
		hlstats_Clans.clanId = hlstats_Players.clan
	WHERE
		hlstats_Players.playerId = ?
	LIMIT
		1
`

	queryFavoriteMapByPlayer = `
	SELECT
		hlstats_Events_Entries.map,
		COUNT(map) AS cnt
	FROM
			hlstats_Events_Entries
	WHERE
			hlstats_Events_Entries.playerId = ?
	GROUP BY
			hlstats_Events_Entries.map
	ORDER BY
			cnt DESC
	LIMIT
		1
`
	queryFavoriteWeaponByPlayer = `
	SELECT
		hlstats_Events_Frags.weapon,
		hlstats_Weapons.name,
		COUNT(hlstats_Events_Frags.weapon) AS kills,
		SUM(hlstats_Events_Frags.headshot=1) as headshots
	FROM
		hlstats_Events_Frags
	LEFT JOIN
		hlstats_Weapons
	ON
		hlstats_Weapons.code = hlstats_Events_Frags.weapon
	WHERE
		hlstats_Events_Frags.killerId=?
	GROUP BY
		hlstats_Events_Frags.weapon,
		hlstats_Weapons.weaponid
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
		hlstats_Games
	WHERE
		hidden='0'
	ORDER BY
		realgame, name ASC
`
	queryWeaponsRealKillsAndHeadshots = `
	SELECT
		IF(IFNULL(SUM(hlstats_Weapons.kills), 0) = 0, 1, SUM(hlstats_Weapons.kills)) AS kills,
		IF(IFNULL(SUM(hlstats_Weapons.headshots), 0) = 0, 1, SUM(hlstats_Weapons.headshots)) AS headshots
	FROM
		hlstats_Weapons
	WHERE
		hlstats_Weapons.game = ?
`

	queryMapsRealKillsAndHeadshots = `
	SELECT
		SUM(hlstats_Maps_Counts.kills) AS kills,
		SUM(hlstats_Maps_Counts.headshots)  AS headshots
	FROM
		hlstats_Maps_Counts
	WHERE
		hlstats_Maps_Counts.game = ?
`

	queryWeapons = `
	SELECT
		hlstats_Weapons.code AS weapon,		
		hlstats_Weapons.name,
		hlstats_Weapons.kills, 
		ROUND(hlstats_Weapons.kills / ? * 100, 2) AS kpercent,
		hlstats_Weapons.headshots,
		ROUND(hlstats_Weapons.headshots / IF(hlstats_Weapons.kills = 0, 1, hlstats_Weapons.kills), 2) AS hpk,
		ROUND(hlstats_Weapons.headshots / ? * 100, 2) AS hpercent,
		hlstats_Weapons.modifier
	FROM
		hlstats_Weapons
	WHERE
		hlstats_Weapons.game = ?
		AND hlstats_Weapons.kills > 0 
	GROUP BY
		hlstats_Weapons.weaponId
	ORDER BY
		%s,
		weapon desc
`

	queryGameByCode = `
	SELECT
		hlstats_Games.name
	FROM
		hlstats_Games
	WHERE
		hlstats_Games.code = ?
`

	queryActionsByGame = `
	SELECT
		hlstats_Actions.code,
		hlstats_Actions.description,
		hlstats_Actions.count,
		hlstats_Actions.reward_player
	FROM
		hlstats_Actions
	WHERE
		hlstats_Actions.game = ?
		AND hlstats_Actions.count > 0
	GROUP BY
		hlstats_Actions.id
	ORDER BY
		count desc, 
		description desc

`

	querySkillChangeByPlayer = `
	SELECT UNIX_TIMESTAMP(eventTime) AS ts, skill, skill_change FROM hlstats_Players_History WHERE playerId = ? ORDER BY eventTime DESC LIMIT 30
`

	queryTotalPlayers24hByGame = `
			SELECT 
				players 
			FROM 
				hlstats_Trend 
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
		hlstats_Players
	WHERE 
		game=?
`

	queryGameGetTotalStatsByGame = `
	SELECT
		SUM(kills) AS count_kills,
		SUM(headshots) AS count_headshots,
		count(serverId)	AS count_servers	
	FROM
		hlstats_Servers
	WHERE 
		game=?
`

	queryMapKillsAndHeadshotsByGame = `
	 	SELECT
		SUM(hlstats_Maps_Counts.kills) AS count_kills,
		SUM(hlstats_Maps_Counts.headshots) AS count_headshots
	FROM
		hlstats_Maps_Counts
	WHERE
		hlstats_Maps_Counts.game = ?
`

	queryMaps = `
	SELECT
		IF(hlstats_Maps_Counts.map = '', '(Unaccounted)', hlstats_Maps_Counts.map) AS map,
		hlstats_Maps_Counts.kills,
		ROUND(kills / ? * 100, 2) AS kpercent,
		hlstats_Maps_Counts.headshots,
		ROUND(hlstats_Maps_Counts.headshots / IF(hlstats_Maps_Counts.kills = 0, 1, hlstats_Maps_Counts.kills), 2) AS hpk,
		ROUND(hlstats_Maps_Counts.headshots / ? * 100, 2) AS hpercent
	FROM
		hlstats_Maps_Counts
	WHERE
		hlstats_Maps_Counts.game = ?
	ORDER BY
		%s,
		map asc
`
	queryMapEventsFragsAndPlayers = `
	SELECT
		hlstats_Events_Frags.killerId,
		hlstats_Players.lastName,
		hlstats_Players.flag as flag,
		COUNT(hlstats_Events_Frags.map) AS frags,
		SUM(hlstats_Events_Frags.headshot=1) as headshots,
		IFNULL(SUM(hlstats_Events_Frags.headshot=1) / Count(hlstats_Events_Frags.map), '-') AS hpk
	FROM
		hlstats_Events_Frags,
		hlstats_Players	
	WHERE
		hlstats_Players.playerId = hlstats_Events_Frags.killerId
		AND hlstats_Events_Frags.map=?
		AND hlstats_Players.game=?
		AND hlstats_Players.hideranking<>'1'
	GROUP BY
		hlstats_Events_Frags.killerId
`

	queryMapTotalKills = `
	SELECT
		COUNT(DISTINCT hlstats_Events_Frags.killerId),
		SUM(hlstats_Events_Frags.map='$map')
	FROM
		hlstats_Events_Frags,
	  hlstats_Servers
	WHERE
		hlstats_Servers.serverId = hlstats_Events_Frags.serverId
		AND hlstats_Events_Frags.map='$map'
		AND hlstats_Servers.game='$game'
`
)
