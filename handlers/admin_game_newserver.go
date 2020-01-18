package handlers

import (
	"fmt"
	"net"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func AdminGameNewServerGET(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		game := ctx.Param("game")
		games, err := store.GetGames(false)
		if err != nil {
			fmt.Println(err)
			return err
		}
		modsSupported, err := store.GetModsSupported()
		if err != nil {
			fmt.Println(err)
			return err
		}
		return render(ctx, 200, "admin/game_new_server", map[string]interface{}{
			"game":            game,
			"IsGameNewServer": true,
			"menu_games":      games,
			"login":           ctx.Get("login"),
			"mods_supported":  modsSupported,
		})
	}
}

func AdminGameNewServerPOST(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		log := middleware.FromContext(ctx)
		game := ctx.Param("game")
		gameMod := ctx.FormValue("game_mod")
		publicAddress := ctx.FormValue("public_address")
		serverAddress := net.ParseIP(ctx.FormValue("server_address")).String()
		if serverAddress == "<nil>" {
			log.Error().Msg("Handler AdminGameNewServerPOST parse server_address ")
			return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
		}
		serverName := ctx.FormValue("server_name")
		serverRcon := ctx.FormValue("server_rcon")
		serverPort, err := strconv.ParseInt(ctx.FormValue("server_port"), 10, 64)
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminGameNewServerPOST parse server port ")
			return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
		}

		realGame, err := store.GetRealGameByGameCode(game)
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminGameNewServerPOST AddNewServer")
			return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
		}

		server := &core.Server{
			Address:       serverAddress,
			Game:          game,
			Name:          serverName,
			Port:          serverPort,
			PublicAddress: publicAddress,
			RconPassword:  serverRcon,
		}

		if err := store.AddNewServer(gameMod, realGame, ctx.Request().RemoteAddr, server); err != nil {
			log.Error().Err(err).Msg("Handler AdminGameNewServerPOST AddNewServer")
			return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
		}

		return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
	}
}
