package admin

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/store/mysql"
)

func IndexPOST(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		ctx.Request().ParseForm()
		for k, v := range ctx.Request().PostForm {
			option, err := store.GetOptionByName(k)
			if err != nil && err != sql.ErrNoRows {
				fmt.Println(err)
				continue
			}
			if option != nil {
				if err := store.UpdateOption(k, v[0]); err != nil {
					fmt.Println(err)
				}
			} else {
				if err := store.InsertOption(&core.Option{
					Key:   k,
					Value: v[0],
				}); err != nil {
					fmt.Println(err)
				}
			}
		}
		return ctx.Redirect(http.StatusFound, "/admin/")
	}
}

func IndexGET(store *mysql.DataStore) echo.HandlerFunc {
	selectOptionsTypes := map[string]struct{}{
		"bannerdisplay":            {},
		"playerinfo_tabs":          {},
		"slider":                   {},
		"nav_globalchat":           {},
		"nav_cheaters":             {},
		"show_weapon_target_flash": {},
		"show_server_load_image":   {},
		"showqueries":              {},
		"countrydata":              {},
		"show_google_map":          {},
		"google_map_region":        {},
		"google_map_type":          {},
		"UseGeoIPBinary":           {},
		"gamehome_show_awards":     {},
		"display_style_selector":   {},
		"display_gamelist":         {},
		"rankingtype":              {},
		"Mode":                     {},
		"AllowOnlyConfigServers":   {},
		"DNSResolveIP":             {},
		"Rcon":                     {},
		"RconIgnoreSelf":           {},
		"RconRecord":               {},
		"UseTimestamp":             {},
		"TrackStatsTrend":          {},
		"GlobalBanning":            {},
		"LogChat":                  {},
		"LogChatAdmins":            {},
		"GlobalChat":               {},
		"SkillRatioCap":            {},
		"modrewrite":               {},
	}

	return func(ctx echo.Context) error {
		options, err := store.GetOptions()
		if err != nil {
			fmt.Println(err)
			return err
		}

		for i := range options {
			if _, ok := selectOptionsTypes[i]; ok {
				options[i].Type = "select"
				optionChoices, err := store.GetOptionsChoices(i)
				if err != nil {
					fmt.Println(err)
					return err
				}
				options[i].OptionChoices = optionChoices
			} else {
				options[i].Type = "text"
			}
		}

		game := ctx.Param("game")

		games, err := store.GetGames(false)
		if err != nil {
			fmt.Println(err)
			return err
		}

		return render(ctx, http.StatusOK, "admin/index", map[string]interface{}{
			"game":       game,
			"menu_games": games,
			"options":    options,
			"IsIndex":    true,
		})
	}
}
