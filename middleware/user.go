package middleware

import (
	"net/http"

	"github.com/dchest/authcookie"
	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/store/mysql"
)

func AuthMiddleware(store *mysql.DataStore) echo.MiddlewareFunc {
	skipper := NewSkipper()
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(ctx echo.Context) error {
			if skipper(ctx) {
				return next(ctx)
			}

			log := FromContext(ctx)
			cookie, err := ctx.Cookie("_session")
			if err != nil {
				if err == http.ErrNoCookie {
					return next(ctx)
				}
				log.Error().Err(err).Msg("AuthMiddleware Cookie error")
				return next(ctx)
			}

			login := authcookie.Login(cookie.Value, []byte("TODO: BAD SECRET"))
			if login != "" {
				dbAccount, err := store.GetUser(login)
				if err != nil {
					log.Error().Err(err).Msg("AuthMiddleware GetUserLogin error")
					return err
				}
				ctx.Set("login", dbAccount)
			}
			return next(ctx)
		}
	}
}

func RequireLogin() echo.MiddlewareFunc {
	skipper := NewSkipper()
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(ctx echo.Context) error {
			if skipper(ctx) {
				return next(ctx)
			}

			if ctx.Request().URL.Path == "/admin/auth" {
				return next(ctx)
			}

			login := getUser(ctx)
			if login == nil {
				return ctx.Redirect(http.StatusFound, "/admin/auth")
			}

			return next(ctx)
		}
	}
}

func getUser(ctx echo.Context) *core.User {
	user, ok := ctx.Get("login").(*core.User)
	if !ok {
		return nil
	}
	return user
}
