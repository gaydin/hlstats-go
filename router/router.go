package router

import (
	"github.com/labstack/echo/v4"
	"github.com/rs/zerolog"

	"go-hlstats/handlers"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func RegisterHandlers(e *echo.Echo, store *mysql.DataStore, log zerolog.Logger) {
	e.GET("/", handlers.Index(store))
	e.GET("/player/:id", handlers.Player(store))
	e.Use(
		middleware.LoggerMiddleware(log),
		middleware.AuthMiddleware(store),
	)

	gameGroup := e.Group("/game/:game")
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

	// admin zone
	adminGroup := e.Group("/admin")
	adminGroup.Use(middleware.RequireLogin())

	adminGroup.GET("/", handlers.AdminIndexGET(store))
	adminGroup.POST("/", handlers.AdminIndexPOST(store))
	adminGroup.GET("/auth", handlers.AdminAuthGET())
	adminGroup.POST("/auth", handlers.AdminAuthPOST(store))
	adminGroup.GET("/users", handlers.AdminUsersGET(store))
	adminGroup.POST("/users", handlers.AdminUsersPOST(store))
	adminGroup.GET("/games", handlers.AdminGamesGET(store))
	adminGroup.POST("/games", handlers.AdminGamesPOST(store))

}
