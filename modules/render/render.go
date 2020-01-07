package render

import (
	"html/template"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"github.com/labstack/echo/v4"
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

func New(templateName string) (*Template, error) {
	templateDir := filepath.Join("public", templateName)
	t, err := findAndParseTemplates(templateDir + "/templates")
	if err != nil {
		return nil, err
	}
	return &Template{
		templates: t,
	}, nil
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

			name := path[pfx:]
			t := root.New(name[:len(name)-len(suffix)]).Funcs(getTemplateFunctemplate())
			t, e2 = t.Parse(string(b))
			if e2 != nil {
				return e2
			}
		}

		return nil
	})

	return root, err
}
