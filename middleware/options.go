package middleware

import (
	"log"

	"github.com/labstack/echo/v4"

	"go-hlstats/store/mysql"
)

func OptionsMiddleware(store *mysql.DataStore) echo.MiddlewareFunc {
	skipper := NewSkipper()
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(ctx echo.Context) error {
			if skipper(ctx) {
				return next(ctx)
			}
			options, err := store.GetOptions()
			if err != nil {
				log.Println(err)
			}
			ctx.Set("options", options)
			return next(ctx)
		}
	}
}
