package router

import (
	"github.com/labstack/echo/v4"

	"go-hlstats/handlers"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func RegisterHandlers(e *echo.Echo, store *mysql.DataStore) {
	e.GET("/", handlers.Index(store))
	e.GET("/player/:id", handlers.Player(store))
	e.Use(middleware.AuthMiddleware(store))
	gameGroup := e.Group("/game/:game")
	{
		gameGroup.GET("/", handlers.Game(store))
		gameGroup.GET("/chat", handlers.GameChat())
		gameGroup.GET("/clans", handlers.GameClans())
		gameGroup.GET("/clans/country", handlers.GameClansCountry())
		gameGroup.GET("/awards", handlers.GameAwards())
		gameGroup.GET("/actions", handlers.GameActions(store))
		gameGroup.GET("/weapons", handlers.GameWeapons(store))
		gameGroup.GET("/maps", handlers.GameMaps(store))
		gameGroup.GET("/maps/:map", handlers.GameMap(store))
		gameGroup.GET("/players", handlers.GamePlayers(store))
	}
	adminGroup := e.Group("/admin")
	adminGroup.Use(middleware.RequireLogin())
	{
		adminGroup.POST("/auth", handlers.AdminAuthPOST(store))
		adminGroup.GET("/", handlers.AdminIndexGET())
		adminGroup.GET("/options", handlers.AdminOptionsGET(store))
		//adminGroup.GET("/", )
	}
}
