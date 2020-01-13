package middleware

import (
	"bytes"
	"encoding/base64"
	"encoding/gob"
	"log"
	"net/http"
	"time"

	"github.com/labstack/echo/v4"
	"github.com/rs/zerolog"

	"go-hlstats/core"
)

func FlashMiddleware(log zerolog.Logger) echo.MiddlewareFunc {
	skipper := NewSkipper()
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(ctx echo.Context) error {
			if skipper(ctx) {
				return next(ctx)
			}
			flash, err := getFlash(ctx)
			if err != nil {
				log.Error().Err(err).Msg("FlashMiddleware getFlash")
			}
			ctx.Set("flash", flash)
			return next(ctx)
		}
	}
}
func FlashSuccess(c echo.Context, message string) {
	addFlash(c, 1, message)
}

func FlashError(c echo.Context, message string) {
	addFlash(c, 2, message)
}

func FlashInfo(c echo.Context, message string) {
	addFlash(c, 3, message)
}

func addFlash(c echo.Context, t int, message string) {
	flash := &core.Flash{
		Type:    t,
		Message: message,
	}

	var buf bytes.Buffer
	if err := gob.NewEncoder(&buf).Encode(flash); err != nil {
		log.Fatal("encode error:", err)
	}

	cookie := &http.Cookie{
		Name:  "_flash",
		Value: base64.URLEncoding.EncodeToString(buf.Bytes()),
	}

	c.SetCookie(cookie)
}

func getFlash(c echo.Context) (*core.Flash, error) {
	cookie, err := c.Cookie("_flash")
	if err != nil {
		switch err {
		case http.ErrNoCookie:
			return nil, nil
		default:
			return nil, err
		}
	}
	value, err := base64.URLEncoding.DecodeString(cookie.Value)
	if err != nil {
		return nil, err
	}
	var flash *core.Flash
	if err = gob.NewDecoder(bytes.NewBuffer(value)).Decode(&flash); err != nil {
		return nil, err
	}

	dc := &http.Cookie{Name: "_flash", MaxAge: -1, Expires: time.Unix(1, 0)}
	c.SetCookie(dc)
	return flash, nil
}
