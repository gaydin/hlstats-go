package middleware

import (
	"strings"

	"github.com/labstack/echo/v4"
)

type Skipper func(echo.Context) bool

func NewSkipper() Skipper {
	return func(ctx echo.Context) bool {
		if strings.HasPrefix(ctx.Request().URL.String(), "/public/") {
			return true
		}
		if strings.HasPrefix(ctx.Request().URL.String(), "/metrics") {
			return true
		}
		if strings.HasPrefix(ctx.Request().URL.String(), "/favicon.ico") {
			return true
		}
		return false
	}
}
