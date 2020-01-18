package handlers

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"net/http"
	"net/url"
	"strconv"
	"strings"

	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func AdminUsersGET(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		log := middleware.FromContext(ctx)
		users, err := store.GetUsers()
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminUsersGET GetUsers")
		}
		games, err := store.GetGames(false)
		if err != nil {
			fmt.Println(err)
			return err
		}

		return render(ctx, http.StatusOK, "admin/users", map[string]interface{}{
			"game":       "",
			"IsUsers":    true,
			"menu_games": games,
			"login":      ctx.Get("login"),
			"users":      users,
		})
	}
}

func AdminUsersPOST(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		log := middleware.FromContext(ctx)

		if err := ctx.Request().ParseForm(); err != nil {
			log.Error().Err(err).Msg("Handler AdminUsersPOST ParseForm")
		}

		// Create new user
		if needCreateNewUser(ctx.Request().PostForm) {
			if !passwordIsCorrect(ctx.Request().PostForm) {
				// TODO change to flash
				return fmt.Errorf("incorrect password")
			}

			accLevel, ok := getAccLevelFromForm(ctx.Request().PostForm, "new_acclevel")
			if !ok {
				// TODO change to flash
				return fmt.Errorf("incorrect access level")
			}

			hasher := md5.New()
			hasher.Write([]byte(ctx.Request().PostForm["new_password"][0]))

			newUser := &core.User{
				Username: ctx.Request().PostForm["new_username"][0],
				Password: hex.EncodeToString(hasher.Sum(nil)),
				AccLevel: accLevel,
			}

			err := store.CreateUser(newUser)
			if err != nil {
				log.Error().Err(err).Msg("Handler AdminUsersPOST CreateUser create new user")
				return err
			}
		}

		// update or delete users
		// TODO: rows[]
		for _, userName := range getUserNamesForUpdate(ctx.Request().PostForm) {
			if needDelete(ctx.Request().PostForm[userName+"_delete"]) {
				err := store.DeleteUser(userName)
				if err != nil {
					log.Error().Err(err).Msg("Handler AdminUsersPOST DeleteUser")
					return err
				}
				continue
			}
			user, err := store.GetUser(userName)
			if err != nil {
				log.Error().Err(err).Msg("Handler AdminUsersPOST GetUser update")
				return err
			}
			accLevel, ok := getAccLevelFromForm(ctx.Request().PostForm, userName+"_acclevel")
			if !ok {
				// TODO change to flash
				return fmt.Errorf("incorrect access level for %s", userName)
			}

			if len(ctx.Request().PostForm[userName+"_username"]) == 0 {
				return fmt.Errorf("incorrect new user name for %s", userName)
			}

			hasher := md5.New()
			hasher.Write([]byte(ctx.Request().PostForm[userName+"_password"][0]))

			user.Username = ctx.Request().PostForm[userName+"_username"][0]
			if len(ctx.Request().PostForm[userName+"_password"]) != 0 {
				user.Password = hex.EncodeToString(hasher.Sum(nil))
			}

			user.AccLevel = accLevel

			if err := store.UpdateUser(userName, user); err != nil {
				return err
			}
		}
		return ctx.Redirect(http.StatusFound, "/admin/users")
	}
}

func needCreateNewUser(values url.Values) bool {
	if len(values["new_username"]) == 0 {
		return false
	}
	return values["new_username"][0] != ""
}

func passwordIsCorrect(values url.Values) bool {
	if len(values["new_password"]) == 0 {
		return false
	}
	return values["new_password"][0] != ""
}

func getAccLevelFromForm(values url.Values, fieldName string) (int64, bool) {
	if len(values[fieldName]) == 0 {
		return 0, false
	}

	i, err := strconv.Atoi(values[fieldName][0])
	if err != nil {
		return 0, false
	}
	return int64(i), true
}

func getUserNamesForUpdate(values url.Values) []string {
	var usernames []string
	for formName := range values {
		if strings.HasSuffix(formName, "_username") && formName != "new_username" {
			usernames = append(usernames, formName[:len(formName)-9])
		}
	}
	return usernames
}

func needDelete(values []string) bool {
	if len(values) == 0 {
		return false
	}
	return values[0] == "1"
}
