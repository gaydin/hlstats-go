package middleware

import (
	"time"

	"github.com/labstack/echo/v4"
	"github.com/rogpeppe/fastuuid"
	"github.com/rs/zerolog"
)

func FromContext(c echo.Context) *zerolog.Logger {
	logger := c.Get("logger").(*zerolog.Logger)
	return logger
}

func LoggerMiddleware(log zerolog.Logger) echo.MiddlewareFunc {
	uuidGenerator := fastuuid.MustNewGenerator()
	skipper := NewSkipper()
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c echo.Context) error {
			if skipper(c) {
				return next(c)
			}
			id := c.Request().Header.Get(echo.HeaderXRequestID)
			if id == "" {
				id = uuidGenerator.Hex128()
			}

			req := c.Request()

			log := log.With().
				Str("id", id).
				Str("method", req.Method).
				Str("uri", req.RequestURI).
				Str("remote_ip", c.RealIP()).
				Logger()

			c.Set("logger", &log)
			start := time.Now()

			err := next(c)
			if err != nil {
				c.Error(err)
			}

			res := c.Response()

			log = log.With().
				Int("status", res.Status).
				Err(err).
				Str("latency", time.Since(start).String()).
				Logger()

			n := res.Status
			switch {
			case n >= 500:
				log.Error().Msg("server error")
			case n >= 400:
				log.Warn().Msg("Client error")
			case n >= 300:
				log.Info().Msg("Redirection")
			default:
				log.Info().Msg("Success")
			}

			return nil
		}
	}
}
