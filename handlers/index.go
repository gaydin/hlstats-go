package handlers

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/core"
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

		topPlayersByGame := make(map[string]*core.Player)
		for i := range games {
			topPlayer, err := store.GetTopPlayerByGame(games[i].Code)
			if err != nil {
				if err == sql.ErrNoRows {
					continue
				}
				fmt.Println(err)
				return err
			}
			topPlayersByGame[games[i].Code] = topPlayer
		}

		return c.Render(http.StatusOK, "index", map[string]interface{}{
			//"user"
			"games":              games,
			"top_player_by_game": topPlayersByGame,
		})
	}
}
