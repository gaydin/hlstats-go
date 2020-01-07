package router

import (
	"github.com/labstack/echo/v4"

	"go-hlstats/handlers"
	"go-hlstats/store/mysql"
)

func RegisterHandlers(e *echo.Echo, store *mysql.DataStore) {
	e.GET("/", handlers.Index(store))
	e.GET("/player/:id", handlers.Player(store))
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
}