package handlers

import (
	"fmt"
	"net/http"
	"net/url"
	"strings"

	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func AdminGamesGET(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		log := middleware.FromContext(ctx)

		games, err := store.GetGames(true)
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminGamesGET GetGames")
			return err
		}

		supportedGames, err := store.GetSupportedGames()
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminGamesGET GetSupportedGames")
			return err
		}

		menuGames, err := store.GetGames(false)
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminGamesGET GetGames")
			return err
		}

		return ctx.Render(http.StatusOK, "admin/games", map[string]interface{}{
			"game":            "",
			"menu_games":      menuGames,
			"games":           games,
			"supported_games": supportedGames,
			"login":           ctx.Get("login"),
		})
	}
}

func AdminGamesPOST(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		log := middleware.FromContext(ctx)

		if err := ctx.Request().ParseForm(); err != nil {
			log.Error().Err(err).Msg("Handler AdminUsersPOST ParseForm")
		}
		urlValues := ctx.Request().PostForm
		for k, v := range ctx.Request().PostForm {
			fmt.Printf("key: %s, value: %s\n", k, v)
		}

		// update games
		for _, gameCode := range urlValues["rows[]"] {

			var hiddenValue string
			if len(urlValues[gameCode+"_hidden"]) != 0 {
				hiddenValue = urlValues[gameCode+"_hidden"][0]
			} else {
				hiddenValue = "0"
			}

			if len(urlValues[gameCode+"_name"]) == 0 {
				fmt.Println("error _name")
				continue
			}

			if len(urlValues[gameCode+"_realgame"]) == 0 {
				fmt.Println("error _realgame", gameCode+"_realgame")
				continue
			}

			name := urlValues[gameCode+"_name"][0]
			newRealGame := urlValues[gameCode+"_realgame"][0]

			game := &core.Game{
				Code:     gameCode,
				Name:     name,
				RealGame: newRealGame,
			}
			if err := store.UpdateGame(gameCode, hiddenValue, game); err != nil {
				log.Error().Err(err).Msg("Handler AdminUsersPOST UpdateGame")
				return err
			}
		}
		return ctx.Redirect(http.StatusFound, "/admin/games")
	}
}

func getGamesNamesForUpdate(values url.Values) []string {
	var games []string
	for formName := range values {
		if strings.HasSuffix(formName, "_code") {
			games = append(games, formName[:len(formName)-5])
		}
	}
	return games
}
