package handlers

import (
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/store/mysql"
)

func GameActions(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		paramGame := c.Param("game")
		_, err := store.GetGameByCode(paramGame)
		if err != nil {
			return err
		}
		actions, err := store.GetActionsByGame(paramGame)
		return render(c, http.StatusOK, "game/actions", map[string]interface{}{
			"pageIsActions": struct{}{},
			"game":          paramGame,
			"actions":       actions,
		})
	}
}
