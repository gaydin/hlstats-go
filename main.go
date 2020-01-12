package main

import (
	"os"

	"github.com/rs/zerolog"

	"go-hlstats/config"
	"go-hlstats/modules/render"
	"go-hlstats/router"
	"go-hlstats/store/mysql"

	"github.com/labstack/echo/v4"
)

func main() {
	log := zerolog.New(os.Stderr).With().Timestamp().Logger()
	conf, err := config.Load()
	if err != nil {
		log.Fatal().Err(err).Msg("msg")
	}

	e := echo.New()
	e.HideBanner = true
	e.HidePort = true
	r, err := render.New(conf)
	if err != nil {
		log.Fatal().Err(err).Msg("init render error")
		return
	}

	e.Renderer = r

	if conf.Debug {
		render.TemplateUpdater(e, conf, log)
	}

	e.Static("/public/*", "public/main/static")

	store, err := mysql.New(conf.DBUrl)
	if err != nil {
		log.Fatal().Err(err).Msg("init store error")
		return
	}

	router.RegisterHandlers(e, store, log)
	log.Info().Str("port", conf.Port).Bool("debug", conf.Debug).Msg("Starting server")
	e.Logger.Fatal(e.Start(":" + conf.Port))
}
