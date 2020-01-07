package main

import (
	"log"
	"time"

	"go-hlstats/config"
	"go-hlstats/modules/render"
	"go-hlstats/router"
	"go-hlstats/store/mysql"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	conf, err := config.Load()
	if err != nil {
		log.Fatal(err)
	}
	log.SetFlags(log.LstdFlags | log.Lshortfile)
	e := echo.New()
	e.HideBanner = true
	e.HidePort = true
	r, err := render.New("main")
	if err != nil {
		log.Fatal(err)
		return
	}

	go func() {
		for {
			time.Sleep(2 * time.Second)
			r, err := render.New("main")
			if err != nil {
				log.Println(err)
				continue
			}
			e.Renderer = r
		}
	}()
	e.Renderer = r
	e.Static("/public/*", "public/main/static")
	s, err := mysql.New(conf.DBUrl())
	if err != nil {
		log.Fatal(err)
		return
	}
	router.RegisterHandlers(e, s)
	e.Use(middleware.Logger())
	e.Logger.Fatal(e.Start(":" + conf.Port))
}
