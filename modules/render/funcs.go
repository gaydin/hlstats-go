package render

import (
	"fmt"
	"html/template"
	"net/url"
	"strings"
)

func getTemplateFunctemplate() template.FuncMap {
	return template.FuncMap{
		"ToLower":          ToLower,
		"BarGraph":         BarGraph,
		"GetFlag":          GetFlag,
		"Inc":              Increment,
		"sortRow":          sortRow,
		"isEnabledSorting": isEnabledSorting,
		"getSortOrder":     getSortOrder,
	}
}

func isEnabledSorting(u *url.URL, sort string) bool {
	return u.Query().Get("sort") == sort
}

func getSortOrder(u *url.URL) string {
	if "asc" == u.Query().Get("sortorder") {
		return "ascending"
	}
	return "descending"
}

func BarGraph(vv interface{}) template.HTML {
	var val int64
	switch v := vv.(type) {
	case float64:
		val = int64(v)
	case int64:
		val = v
	}
	cellBody := `<img src="/public/hlstatsimg/bar`
	switch {
	case val > 40:
		cellBody += "6"
	case val > 30:
		cellBody += "5"
	case val > 20:
		cellBody += "4"
	case val > 10:
		cellBody += "3"
	case val > 5:
		cellBody += "2"
	default:
		cellBody += "1"
	}
	cellBody += `.gif" style="width:`
	switch {
	case val < 1:
		cellBody += "1"
	case val > 100:
		cellBody += "100"
	default:
		cellBody += fmt.Sprintf("%d", val)
	}
	cellBody += `%;" class="bargraph" alt="` + fmt.Sprintf("%d", val) + `" />`
	return template.HTML(cellBody)
}

func ToLower(val string) string {
	return strings.ToLower(val)
}

func GetFlag(flag string) template.HTML {
	if flag == "" {
		return "0"
	}
	return template.HTML(strings.ToLower(flag))
}

func Increment(v int) int {
	v++
	return v
}

func sortRow(u *url.URL, name string) string {
	const defaultOrder = "desc"
	q := u.Query()
	currentOrder := q.Get("sort")
	if currentOrder == name {
		switch q.Get("sortorder") {
		case defaultOrder:
			q.Set("sortorder", "asc")
			return u.Path + "?" + q.Encode()
		default:
			q.Set("sortorder", defaultOrder)
			return u.Path + "?" + q.Encode()
		}
	}
	q.Set("sort", name)
	q.Set("sortorder", defaultOrder)
	return u.Path + "?" + q.Encode()
}
