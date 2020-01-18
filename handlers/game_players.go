package handlers

import (
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/handlers/utils"
	"go-hlstats/modules/pagination"
	"go-hlstats/store/mysql"
)

func GamePlayers(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		game := c.Param("game")

		limit, offset, page := utils.GetLimitOffsetPage(c)
		sort, order := utils.GetSortAndOrder(c, gamePlayersOrderValidate)
		players, total, err := store.GetPlayersByGame(game, offset, limit, sort, order)
		if err != nil {
			return err
		}

		paginator := pagination.NewPagination(int(total), limit, page, 5)
		return render(c, http.StatusOK, "game/players", map[string]interface{}{
			"pageIsPlayers": struct{}{},
			"game":          game,
			"players":       players,
			"playersTotal":  total,
			"pagination":    paginator,
			"sort":          sort,
			"order":         order,
		})
	}
}

func gamePlayersOrderValidate(s string) string {
	switch s {
	case "lastName", "connection_time", "kills", "deaths", "kpd", "headshots", "hpk", "acc":
		return s
	default:
		return "skill"
	}
}

func GameClansCountry() echo.HandlerFunc {
	return func(c echo.Context) error {
		return render(c, http.StatusOK, "game/clans_country", nil)
	}
}
