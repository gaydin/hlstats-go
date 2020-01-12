package handlers

import (
	"database/sql"
	"fmt"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"

	"go-hlstats/core"
	"go-hlstats/middleware"
	"go-hlstats/store/mysql"
)

func Player(store *mysql.DataStore) echo.HandlerFunc {
	return func(c echo.Context) error {
		log := middleware.FromContext(c)
		playerID, _ := strconv.ParseInt(c.Param("id"), 10, 64)
		if playerID == 0 {
			return nil
		}
		playerData, err := store.GetPlayerWithClanByID(playerID)
		if err != nil {
			log.Error().Err(err).Msg("Handler Player GetPlayerWithClanByID")
			return err
		}

		playerUniqueID, err := store.GetPlayerUniqueID(playerID)
		if err != nil {
			log.Error().Err(err).Msg("Handler Player GetPlayerUniqueID")
			return err
		}

		favoriteWeapon, err := store.GetFavoriteWeaponByPlayer(playerID)
		if err != nil {
			if err != sql.ErrNoRows {
				log.Error().Err(err).Msg("Handler Player GetFavoriteWeaponByPlayer")
				return err
			}
		}

		favoriteMap, err := store.GetFavoriteMapByPlayer(playerID)
		if err != nil {
			if err != sql.ErrNoRows {
				log.Error().Err(err).Msg("Handler Player GetFavoriteMapByPlayer")
				return err
			}
		}

		skillChanges, err := store.GetSkillChangeByPlayer(playerID)
		if err != nil {
			log.Error().Err(err).Msg("Handler Player GetSkillChangeByPlayer")
			return err
		}

		return c.Render(http.StatusOK, "player", map[string]interface{}{
			"game":           playerData.Game,
			"chartData":      getChartData(skillChanges),
			"favoriteMap":    favoriteMap,
			"favoriteWeapon": favoriteWeapon,
			"playerID":       playerID,
			"player":         playerData,
			"killsPerMinute": fmt.Sprintf("%.2f", float64(playerData.Kills)/float64(playerData.ConnectionTime/60)),
			"UQID":           playerUniqueID.UniqueID,
			"COID":           playerUniqueID.CommunityId,
		})
	}
}

func getChartData(skillChanges []*core.SkillChange) *core.ChartData {
	var data core.ChartData
	skullChangeDataSet := core.ChartDataset{
		Label:           "Session",
		BackgroundColor: "rgb(255, 99, 132)",
		BorderColor:     "rgb(255, 99, 132)",
		YAxisID:         "y-axis-1",
	}
	skillDataSet := core.ChartDataset{
		Label:           "Skill",
		YAxisID:         "y-axis-2",
		BackgroundColor: "rgb(255, 205, 86)",
		BorderColor:     "rgb(255, 205, 86)",
		Fill:            true,
	}
	for _, v := range skillChanges {
		data.Labels = append(data.Labels, v.TS)
		skullChangeDataSet.Data = append(skullChangeDataSet.Data, v.SkillChange)
		skillDataSet.Data = append(skillDataSet.Data, v.Skill)
	}
	data.Datasets = append(data.Datasets, &skullChangeDataSet, &skillDataSet)
	return &data
}
