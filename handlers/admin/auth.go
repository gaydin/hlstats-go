package admin

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"net/http"
	"time"

	"github.com/dchest/authcookie"
	"github.com/labstack/echo/v4"

	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func AuthGET() echo.HandlerFunc {
	return func(ctx echo.Context) error {
		if ctx.Get("user") != nil {
			return ctx.Redirect(http.StatusFound, "/admin/")
		}
		return render(ctx, 200, "admin/auth", nil)
	}
}

func AuthPOST(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		log := middleware.FromContext(ctx)
		username := ctx.FormValue("login")
		password := ctx.FormValue("password")
		if username == "" || password == "" {
			fmt.Println("nil data")
			return ctx.Redirect(http.StatusFound, ctx.Request().URL.Path)
		}

		dbAccount, err := store.GetUser(username)
		if err != nil {
			log.Error().Err(err).Msg("Handler AdminAuthPOST GetUserLogin")
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
		Name:    "session",
		Expires: time.Now().Add(120 * time.Hour),
		Value: authcookie.NewSinceNow(
			login,
			60*24*30*time.Second,
			[]byte("TODO: BAD SECRET"),
		),
	}
	c.SetCookie(cookie)
}

func LogoutPOST() echo.HandlerFunc {
	return func(c echo.Context) error {
		cookie := &http.Cookie{
			Name:     "session",
			MaxAge:   2147483647,
			Value:    "",
			Path:     "/",
			HttpOnly: true,
		}
		c.SetCookie(cookie)
		return c.Redirect(http.StatusFound, "/auth")
	}
}
