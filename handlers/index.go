package handlers

import (
	"fmt"
	"log"
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/store/mysql"
)

func Index(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		games, err := store.GetGames(false)
		if err != nil {
			log.Println(err)
			return err
		}

		if len(games) == 1 {
			return c.Redirect(http.StatusFound, fmt.Sprintf("/game/%s/", games[0].Code))
		}

		return c.Render(http.StatusOK, "index", nil)
	}
}
