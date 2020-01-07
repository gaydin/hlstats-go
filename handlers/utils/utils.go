package utils

import (
	"strconv"

	"github.com/labstack/echo/v4"
)

const defaultPageLimit = int64(50)

func GetLimitOffsetPage(c echo.Context, limit ...int64) (int, int, int) {
	l := defaultPageLimit
	if len(limit) > 0 {
		l = int64(limit[0])
	}
	page, _ := strconv.ParseInt(c.QueryParam("page"), 10, 0)
	if page == 0 {
		page = 1
	}
	return int(l), int(l * (page - 1)), int(page)
}

func GetSortAndOrder(c echo.Context, sortValidator func(string) string) (string, string) {
	return sortValidator(c.QueryParam("sort")), validateSortOrder(c.QueryParam("sortorder"))
}

func validateSortOrder(o string) string {
	if o == "asc" {
		return o
	}
	return "desc"
}
