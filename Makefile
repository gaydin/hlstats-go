PROJECT_NAME := "hlstats"
GO_FILES := $(shell find . -name '*.go' | grep -v _test.go)
DOCKER_COMPOSE := "docker-compose"
.PHONY: all revive test build generate clean docker setup help

ifneq ($(DRONE_TAG),)
	VERSION ?= $(subst v,,$(DRONE_TAG))
	HLSTATS_VERSION := $(VERSION)
else
	ifneq ($(DRONE_BRANCH),)
		VERSION ?= $(subst release/v,,$(DRONE_BRANCH))
	else
		VERSION ?= master
	endif
	HLSTATS_VERSION := $(shell git describe --tags --always | sed 's/-/+/' | sed 's/^v//')
endif

LDFLAGS := -X "hlstats.config.Version=$(HLSTATS_VERSION)" -X "main.Tags=$(TAGS)"

all: setup build
	docker-compose up --build hlstats
	docker-compose rm hlstats


lint:
	@hash golangci-lint > /dev/null 2>&1; if [ $$? -ne 0 ]; then \
		curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b $(go env GOPATH)/bin v1.16.0; \
	fi

	golangci-lint run --issues-exit-code 0

test: ## Run unittests
	@go test -cover -short ./...

build: ## Build the binary file
	@GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build --a -installsuffix cgo -ldflags '-s -w $(LDFLAGS)' -o ./build/hlstats/hlstats
	@GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build --a -installsuffix cgo -ldflags '-s -w $(LDFLAGS)' -o ./build/hlstats/hlstats.osx
	@GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build --a -installsuffix cgo -ldflags '-s -w $(LDFLAGS)' -o ./build/hlstats/hlstats.exe
	@cp -r public ./build/hlstats


clean: ## Remove previous build
	@rm -rf build

archive:
	zip -r release.zip build/hlstats/.

docker: build ## Build server in docker
	@docker-compose up --build hlstats

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'