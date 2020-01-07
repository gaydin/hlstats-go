package handlers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func GameAwards() echo.HandlerFunc {
	return func(c echo.Context) error {

		return c.Render(http.StatusOK, "game/awards", nil)
	}
}
