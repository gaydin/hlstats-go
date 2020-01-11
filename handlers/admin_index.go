package handlers

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"
)

func AdminIndexGET() echo.HandlerFunc {
	return func(ctx echo.Context) error {
		fmt.Println("handler index")
		fmt.Println(ctx.Get("login"))

		game := ctx.Param("game")

		return ctx.Render(http.StatusOK, "admin/index", map[string]interface{}{
			"game":  game,
			"login": ctx.Get("login"),
		})
	}
}
