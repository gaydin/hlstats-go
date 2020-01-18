package render

import (
	"html/template"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/labstack/echo/v4"
	"github.com/rs/zerolog"

	"go-hlstats/config"
)

type Template struct {
	templates *template.Template
}

func (t *Template) Render(w io.Writer, name string, data interface{}, c echo.Context) error {
	if v := c.QueryParam("json"); v == "1" {
		return c.JSONPretty(http.StatusOK, data, "  ")
	}
	if m, ok := data.(map[string]interface{}); ok {
		m["URL"] = c.Request().URL
	}
	return t.templates.ExecuteTemplate(w, name, data)
}

func New(config *config.Config) (*Template, error) {
	templateDir := filepath.Join("public", config.TemplateName)
	t, err := findAndParseTemplates(templateDir + "/templates")
	if err != nil {
		return nil, err
	}
	return &Template{
		templates: t,
	}, nil
}

func TemplateUpdater(e *echo.Echo, conf *config.Config, log zerolog.Logger) {
	go func() {
		for {
			time.Sleep(2 * time.Second)
			r, err := New(conf)
			if err != nil {
				log.Debug().Err(err).Msg("TemplateUpdater")
				continue
			}
			e.Renderer = r
		}
	}()
}

func findAndParseTemplates(rootDir string) (*template.Template, error) {
	cleanRoot := filepath.Clean(rootDir)
	pfx := len(cleanRoot) + 1
	root := template.New("")
	suffix := ".tpl"

	err := filepath.Walk(cleanRoot, func(path string, info os.FileInfo, e1 error) error {
		if !info.IsDir() && strings.HasSuffix(path, suffix) {
			if e1 != nil {
				return e1
			}

			b, e2 := ioutil.ReadFile(path)
			if e2 != nil {
				return e2
			}

			name := strings.ReplaceAll(path[pfx:], "\\", "/")
			_, e2 = root.New(name[:len(name)-len(suffix)]).Funcs(getTemplateFunctemplate()).Parse(string(b))
			if e2 != nil {
				return e2
			}
		}

		return nil
	})

	return root, err
}
