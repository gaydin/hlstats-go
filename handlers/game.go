package handlers

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/store/mysql"
)

func Game(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		game := c.Param("game")
		servers, err := store.GetServerByGame(game)
		if err != nil {
			return err
		}

		totalPlayers, err := store.GetTotalPlayersByGame(game)
		if err != nil {
			return err
		}

		totalPlayers24h, err := store.GetTotalPlayers24hByGame(game)
		if err != nil {
			return err
		}

		totalStats, err := store.GetGameGetTotalStatsByGame(game)
		if err != nil {
			return err
		}

		return c.Render(http.StatusOK, "game/index", map[string]interface{}{
			"hpk":            fmt.Sprintf("%.2f", (float64(totalStats.Headshots)/float64(totalStats.Kills))*100),
			"totalKills":     totalStats.Kills,
			"totalHeadshots": totalStats.Headshots,
			"totalServers":   totalStats.Servers,
			"totalPlayers":   totalPlayers,
			"playersLastDay": totalPlayers - totalPlayers24h,
			"pageIsGame":     struct{}{},
			"game":           game,
			"servers":        servers,
		})
	}
}
