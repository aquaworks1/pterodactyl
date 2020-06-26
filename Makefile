## Current directory
DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

## Define the latest version
include $(DIR)/.env

## Config
.DEFAULT_GOAL := help
.PHONY: *


help: ## This help!
	@printf "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m\n"
	@grep -E '^[-a-zA-Z0-9_\.\/]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build Pterodactyl daemon, Pterodactyl panel and Pterodactyl sftp server
	@$(eval daemon_version := $(or $(d),$(LATEST_DAEMON_VERSION)))
	@$(eval sftp_server_version := $(or $(s),$(LATEST_SFTP_SERVER_VERSION)))
	@$(eval panel_version := $(or $(p),$(LATEST_PANEL_VERSION)))
	@cd $(DIR)/docker/daemon && $(MAKE) build d=$(daemon_version) s=$(sftp_server_version)
	@cd $(DIR)/docker/panel && $(MAKE) build p=$(panel_version)
