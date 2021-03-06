package handlers

import (
	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/middleware"
)

func render(ctx echo.Context, code int, name string, data interface{}) error {
	if data == nil {
		return ctx.Render(code, name, data)
	}
	if d, ok := data.(map[string]interface{}); ok {
		d["flash"] = ctx.Get("flash")
		d["user"] = ctx.Get(middleware.UserContextKey)
		if options, ok := ctx.Get("options").(map[string]*core.Option); ok {
			d["OptionsTitle"] = options["sitename"].Value
		}
	}
	return ctx.Render(code, name, data)
}
