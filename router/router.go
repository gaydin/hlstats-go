package router

import (
	"github.com/labstack/echo/v4"
	"github.com/rs/zerolog"

	"go-hlstats/handlers"
	"go-hlstats/handlers/admin"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func RegisterHandlers(e *echo.Echo, store *mysql.DataStore, log zerolog.Logger) {
	e.GET("/", handlers.Index(store))
	e.GET("/player/:id", handlers.Player(store))
	e.Use(
		middleware.LoggerMiddleware(log),
		middleware.AuthMiddleware(store),
		middleware.OptionsMiddleware(store),
		middleware.FlashMiddleware(log),
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

	adminGroup.GET("/", admin.IndexGET(store))
	adminGroup.POST("/", admin.IndexPOST(store))
	adminGroup.GET("/auth", admin.AuthGET())
	adminGroup.POST("/auth", admin.AuthPOST(store))
	adminGroup.POST("/logout", admin.LogoutPOST())
	adminGroup.GET("/users", admin.UsersGET(store))
	adminGroup.POST("/users", admin.UsersPOST(store))
	adminGroup.GET("/games", admin.GamesGET(store))
	adminGroup.POST("/games", admin.GamesPOST(store))
	adminGroup.POST("/voicecomm", admin.VoiceServersPOST(store))
	adminGroup.GET("/voicecomm", admin.VoiceServersGET(store))
	adminGroup.POST("/clantags", admin.ClanTagPatternsPOST(store))
	adminGroup.GET("/clantags", admin.ClanTagPatternsGET(store))
	adminGroup.POST("/hostgroups", admin.HostGroupsPOST(store))
	adminGroup.GET("/hostgroups", admin.HostGroupsGET(store))

	adminGameGroup := adminGroup.Group("/game/:game")

	adminGameGroup.GET("/newserver", admin.GameNewServerGET(store))
	adminGameGroup.POST("/newserver", admin.GameNewServerPOST(store))
	adminGameGroup.GET("/servers", admin.GameServersGET(store))
	adminGameGroup.POST("/servers", admin.GameServersPOST(store))
}
