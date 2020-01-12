package config

import (
	"fmt"

	"github.com/caarlos0/env/v6"
)

type Config struct {
	Debug bool `env:"DEBUG"`

	Port       string `env:"PORT" envDefault:"8080"`
	DBAddress  string `env:"DB_ADDRESS"`
	DBUser     string `env:"DB_USER"`
	DBPassword string `env:"DB_PASSWORD"`
	DBName     string `env:"DB_NAME"`
	DBDriver   string `env:"DB_DRIVER"`
	DBUrl      string

	CookieSessionSecret string `env:"COOKIE_SECRET"`

	TemplateName string `env:"TEMPLATE_NAME" envDefault:"main"`
}

func Load() (*Config, error) {
	var conf Config
	err := env.Parse(&conf)
	if err != nil {
		return nil, err
	}
	conf.DBUrl = fmt.Sprintf("%s:%s@tcp(%s)/%s?parseTime=true",
		conf.DBUser,
		conf.DBPassword,
		conf.DBAddress,
		conf.DBName,
	)
	return &conf, err
}
