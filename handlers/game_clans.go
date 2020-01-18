package handlers

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func GameClans() echo.HandlerFunc {
	return func(c echo.Context) error {

		return render(c, http.StatusOK, "game/clans", nil)
	}
}
