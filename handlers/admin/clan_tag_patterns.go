package admin

import (
	"database/sql"
	"fmt"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func ClanTagPatternsGET(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		log := middleware.FromContext(ctx)

		clanTags, err := store.GetClanTags()
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminGamesGET GetSupportedGames")
			return err
		}

		menuGames, err := store.GetGames(false)
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminGamesGET GetGames")
			return err
		}

		return render(ctx, http.StatusOK, "admin/clan_tags", map[string]interface{}{
			"game":       "",
			"menu_games": menuGames,
			"clan_tags":  clanTags,
			"IsClanTags": true,
		})
	}
}

// TODO: len check
func ClanTagPatternsPOST(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		log := middleware.FromContext(ctx)

		if err := ctx.Request().ParseForm(); err != nil {
			log.Error().Err(err).Msg("Handler AdminUsersPOST ParseForm")
		}

		urlValues := ctx.Request().PostForm

		// update games
		for _, voiceServerIDString := range urlValues["rows[]"] {
			voiceServerID, err := strconv.Atoi(voiceServerIDString)
			if err != nil && voiceServerIDString != "new" {
				fmt.Println(voiceServerIDString, err)
				return err
			}
			serverType, err := strconv.Atoi(urlValues[formKey(voiceServerIDString, "type")][0])
			if err != nil {
				fmt.Println(voiceServerIDString, err)
				//return err
			}
			UDPPort, err := strconv.Atoi(urlValues[formKey(voiceServerIDString, "port")][0])
			if err != nil {
				fmt.Println(voiceServerIDString, err)
				//return err
			}
			queryPort, err := strconv.Atoi(urlValues[formKey(voiceServerIDString, "query_port")][0])
			if err != nil {
				fmt.Println(voiceServerIDString, err)
				//return err
			}

			voiceServer := &core.VoiceServer{
				Addr: urlValues[formKey(voiceServerIDString, "addr")][0],
				Type: int64(serverType),
				Descr: sql.NullString{
					String: urlValues[formKey(voiceServerIDString, "descr")][0],
					Valid:  true,
				},
				Name: urlValues[formKey(voiceServerIDString, "name")][0],
				Password: sql.NullString{
					String: urlValues[formKey(voiceServerIDString, "password")][0],
					Valid:  true,
				},
				UDPPort:   int64(UDPPort),
				QueryPort: int64(queryPort),
			}

			switch {
			case voiceServerIDString == "new":
				if voiceServer.Name == "" && voiceServer.Addr == "" {
					continue
				}
				if err := store.CreateVoiceServer(voiceServer); err != nil {
					return err
				}
			case needDelete(ctx.Request().PostForm[voiceServerIDString+"_delete"]):
				err := store.DeleteVoiceServer(int64(voiceServerID))
				if err != nil {
					log.Error().Err(err).Msg("Handler AdminUsersPOST DeleteUser")
					return err
				}
			default:
				if err := store.UpdateVoiceServer(int64(voiceServerID), voiceServer); err != nil {
					return err
				}
			}

		}
		middleware.FlashSuccess(ctx, "Voice Servers saved")
		return ctx.Redirect(http.StatusFound, "/admin/clantags")
	}
}
