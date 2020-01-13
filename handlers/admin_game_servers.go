package handlers

import (
	"errors"
	"fmt"
	"net"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func AdminGameServersGET(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		game := ctx.Param("game")
		games, err := store.GetGames(false)
		if err != nil {
			fmt.Println(err)
			return err
		}
		servers, err := store.GetAdminServers(game)
		if err != nil {
			return err
		}
		return ctx.Render(200, "admin/game_servers", map[string]interface{}{
			"game":       game,
			"menu_games": games,
			"servers":    servers,
		})
	}
}

func AdminGameServersPOST(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		ctx.Request().ParseForm()
		log := middleware.FromContext(ctx)

		if err := ctx.Request().ParseForm(); err != nil {
			log.Error().Err(err).Msg("Handler AdminGameServersPOST ParseForm")
		}

		urlValues := ctx.Request().PostForm
		game := ctx.Param("game")
		realGame, err := store.GetRealGameByGameCode(game)
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminGameServersPOST AddNewServer")
			return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
		}

		// update games
		for _, serverID := range urlValues["rows[]"] {
			address := ctx.FormValue(formKey(serverID, "address"))
			if net.ParseIP(address) == nil {
				return errors.New("incorrect IP address")
			}
			serverPort, err := strconv.ParseInt(ctx.FormValue(formKey(serverID, "port")), 10, 64)
			if err != nil {
				log.Error().Err(err).Msg("Handler AdminGameServersPOST parse server port")
				return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
			}
			id, err := strconv.ParseInt(serverID, 10, 64)
			if err != nil {
				log.Error().Err(err).Msg("Handler AdminGameServersPOST parse server id ")
				return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
			}
			var sortOrder int64
			if v := ctx.FormValue(formKey(serverID, "sortorder")); v != "" {
				i, err := strconv.ParseInt(ctx.FormValue(formKey(serverID, "sortorder")), 10, 64)
				if err != nil {
					log.Error().Err(err).Msg("Handler AdminGameServersPOST parse sortorder")
					return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
				}
				sortOrder = i
			}

			name := ctx.FormValue(formKey(serverID, "name"))
			rconPassword := ctx.FormValue(formKey(serverID, "rcon_password"))
			if rconPassword == "(encrypted)" {
				rconPassword = ""
			}
			publicAddress := ctx.FormValue(formKey(serverID, "publicaddress"))
			fmt.Println(name)
			server := &core.Server{
				ServerID:      id,
				Address:       address,
				Port:          serverPort,
				Name:          name,
				RconPassword:  rconPassword,
				PublicAddress: publicAddress,
				Game:          realGame,
				SortOrder:     sortOrder,
			}

			if err := store.UpdateAdminServer(server); err != nil {
				log.Error().Err(err).Msg("Handler AdminGameServersPOST UpdateAdminServer")
				return err
			}
		}
		return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
	}
}

func formKey(id, key string) string {
	return id + "_" + key
}
