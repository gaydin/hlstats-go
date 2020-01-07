package handlers

import (
	"log"
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/store/mysql"
)

func GameMap(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		gameMap, game := c.Param("map"), c.Param("game")
		//store.GetGameByCode("")
		eventsFragsAndPlayers, err := store.GetMapEventsFragsAndPlayers(gameMap, game)
		if err != nil {
			log.Println(err)
			return err
		}
		return c.Render(http.StatusOK, "game/map", map[string]interface{}{
			"game": game,
			"data": eventsFragsAndPlayers,
			//"chartData":      getChartData(skillChanges),
			//"favoriteMap":    favoriteMap,
			//"favoriteWeapon": favoriteWeapon,
			//"playerID":       playerID,
			//"player":         playerData,
			//"UQID":           playerUniqueID.UniqueID,
			//"COID":           playerUniqueID.CommunityId,
		})
	}
}
