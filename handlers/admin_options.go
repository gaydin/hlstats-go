package handlers

import (
	"github.com/labstack/echo/v4"

	"go-hlstats/store/mysql"
)

func AdminOptionsGET(store *mysql.DataStore) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		return ctx.Render(200, "admin/options", nil)
	}
}
