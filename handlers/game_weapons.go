package handlers

import (
	"log"
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/handlers/utils"
	"go-hlstats/store/mysql"
)

func GameWeapons(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		game := c.Param("game")
		killsAndHeadshots, err := store.GetRealWeaponsKillsAndHeadshots(game)
		if err != nil {
			log.Println(err)
			return err
		}

		sort, order := utils.GetSortAndOrder(c, gameWeaponsOrderValidate)
		weapons, err := store.GetWeapons(game, killsAndHeadshots.Headshots, killsAndHeadshots.Kills, sort, order)
		if err != nil {
			log.Println(err)
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
