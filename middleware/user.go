package middleware

import (
	"fmt"
	"log"

	"github.com/dchest/authcookie"
	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/store/mysql"
)

func AuthMiddleware(store *mysql.DataStore) echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(ctx echo.Context) error {
			cookie, err := ctx.Cookie("_session")
			if err != nil {
				fmt.Println(err)
				return next(ctx)
			}

			login := authcookie.Login(cookie.Value, []byte("TODO: BAD SECRET"))
			if login != "" {
				dbAccount, err := store.GetUserLogin(login)
				if err != nil {
					log.Println(err)
					return err
				}
				ctx.Set("login", dbAccount)
				//user, err := userStore.GetUserLogin(ctx, login)
				//if err != nil {
				//	log.Error("AuthMiddleware GetUserLogin error", zap.Error(err))
				//	return
				//}
			}
			return next(ctx)
		}
	}
}

func RequireLogin() echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(ctx echo.Context) error {
			if ctx.Request().URL.Path == "/admin/auth" {
				return next(ctx)
			}

			login := getUser(ctx)
			if login == nil {
				return ctx.Render(200, "admin/auth", nil)
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
