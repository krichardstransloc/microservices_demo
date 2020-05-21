V = 0
Q = $(if $(filter 1,$V),,@)
M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: all
all: runservices ; $(info $(M) running services) @  ## Run all

.PHONY: buildnode
buildnode: ; $(info $(M) building base node image) @  ## Build base node image
	$Q docker build -t microservice_node -f docker/Dockerfile.node .

.PHONY: buildgo
buildgo: ; $(info $(M) building base go image) @  ## Build base go image
	$Q docker build -t microservice_go -f docker/Dockerfile.go .

.PHONY: buildpy
buildpy: ; $(info $(M) building base python image) @  ## Build base node image
	$Q docker build -t microservice_python -f docker/Dockerfile.python .

.PHONY: buildservices
buildservices: buildnode buildgo buildpy ; $(info $(M) building services…) @ ## Build services
	$Q docker-compose build

.PHONY: runservices
runservices: ; $(info $(M) running services…) @ ## Run services
	$Q docker-compose up -d

.PHONY: stopservices
stopservices: ; $(info $(M) stopping services…) @ ## Stop services
	$Q docker-compose down

.PHONY: help
help:
	@grep -hE '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-17s\033[0m %s\n", $$1, $$2}'