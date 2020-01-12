package handlers

import (
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/handlers/utils"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func GameWeapons(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		log := middleware.FromContext(c)
		game := c.Param("game")
		killsAndHeadShots, err := store.GetRealWeaponsKillsAndHeadshots(game)
		if err != nil {
			log.Error().Err(err).Msg("Handler GameWeapons GetRealWeaponsKillsAndHeadshots")
			return err
		}

		sort, order := utils.GetSortAndOrder(c, gameWeaponsOrderValidate)
		weapons, err := store.GetWeapons(game, killsAndHeadShots.Headshots, killsAndHeadShots.Kills, sort, order)
		if err != nil {
			log.Error().Err(err).Msg("Handler GameWeapons GetWeapons")
			return err
		}
		return c.Render(http.StatusOK, "game/weapons", map[string]interface{}{
			"pageIsWeapons": struct{}{},
			"game":          game,
			"weapons":       weapons,
		})
	}
}

func gameWeaponsOrderValidate(s string) string {
	switch s {
	case "weapon", "modifier", "kills", "headshots", "hpk":
		return s
	default:
		return "weapon"
	}
}
