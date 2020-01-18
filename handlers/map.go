package handlers

import (
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func GameMap(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		log := middleware.FromContext(c)
		gameMap, game := c.Param("map"), c.Param("game")
		eventsFragsAndPlayers, err := store.GetMapEventsFragsAndPlayers(gameMap, game)
		if err != nil {
			log.Error().Err(err).Msg("Handler GameMap GetMapEventsFragsAndPlayers")
			return err
		}
		return render(c, http.StatusOK, "game/map", map[string]interface{}{
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
