package handlers

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/dchest/authcookie"
	"github.com/labstack/echo/v4"

	"go-hlstats/store/mysql"
)

func AdminAuthGET() echo.HandlerFunc {
	return func(ctx echo.Context) error {
		return ctx.Render(200, "admin/auth", nil)
	}
}

func AdminAuthPOST(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		username := ctx.FormValue("login")
		password := ctx.FormValue("password")
		if username == "" || password == "" {
			fmt.Println("nil data")
			return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
		}

		dbAccount, err := store.GetUserLogin(username)
		if err != nil {
			log.Println(err)
			return err
		}

		md5data := md5.Sum([]byte(password))
		passwordHash := hex.EncodeToString(md5data[:])
		if dbAccount.Password != passwordHash {
			fmt.Println("incorrect login password hash")
			return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
		}

		setSession(ctx, dbAccount.Username)
		return ctx.Redirect(http.StatusFound, "/admin/")
	}
}

func setSession(c echo.Context, login string) {
	cookie := &http.Cookie{
		Name:    "_session",
		Expires: time.Now().Add(120 * time.Hour),
		Value: authcookie.NewSinceNow(
			login,
			60*24*30*time.Second,
			[]byte("TODO: BAD SECRET"),
		),
	}
	c.SetCookie(cookie)
}
