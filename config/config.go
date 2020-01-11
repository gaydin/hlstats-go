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
}

func (c *Config) DBUrl() string {
	return fmt.Sprintf("%s:%s@tcp(%s)/%s?parseTime=true",
		c.DBUser,
		c.DBPassword,
		c.DBAddress,
		c.DBName,
	)
}

func Load() (*Config, error) {
	var conf Config
	err := env.Parse(&conf)
	return &conf, err
}
