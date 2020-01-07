package handlers

import (
	"log"
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/handlers/utils"
	"go-hlstats/store/mysql"
)

func GameMaps(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		game := c.Param("game")

		sort, order := utils.GetSortAndOrder(c, gameMapsOrderValidate)

		killsAndHeadshots, err := store.GetRealMapKillsAndHeadshots(game)
		if err != nil {
			log.Println(err)
			return err
		}

		maps, err := store.GetMaps(game, killsAndHeadshots.Headshots, killsAndHeadshots.Kills, sort, order)
		if err != nil {
			log.Println(err)
			return err
		}
		return c.Render(http.StatusOK, "game/maps", map[string]interface{}{
			"game":       game,
			"pageIsMaps": struct{}{},
			"maps":       maps,
			"sort":       sort,
			"order":      order,
		})
	}
}

func gameMapsOrderValidate(s string) string {
	switch s {
	case "map", "kills", "headshots", "hpk":
		return s
	default:
		return "kills"
	}
}
