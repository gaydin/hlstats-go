package handlers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func GameChat() echo.HandlerFunc {
	return func(c echo.Context) error {

		return c.Render(http.StatusOK, "game/chat", nil)
	}
}
