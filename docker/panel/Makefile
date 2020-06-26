## Meta data about the image
DOCKER_IMAGE=dsuite/pterodactyl-panel
DOCKER_IMAGE_CREATED=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')
DOCKER_IMAGE_REVISION=$(shell git rev-parse --short HEAD)

## Current directory
DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

# env file
include $(DIR)/../../.env

## Config
.DEFAULT_GOAL := help
.PHONY: *


help: ## This help!
	@printf "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m\n"
	@grep -E '^[-a-zA-Z0-9_\.\/]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build Pterodactyl panel
	@$(eval panel_version := $(or $(p),$(LATEST_PANEL_VERSION)))
	@docker run --rm \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-e no_proxy=${no_proxy} \
		-e DOCKER_IMAGE_CREATED=$(DOCKER_IMAGE_CREATED) \
		-e DOCKER_IMAGE_REVISION=$(DOCKER_IMAGE_REVISION) \
		-e PANEL_VERSION=$(panel_version) \
		-v $(DIR):/data \
		dsuite/alpine-data \
		bash -c "templater Dockerfile.template > Dockerfile-$(panel_version)"
	@docker build \
		--build-arg http_proxy=${http_proxy} \
		--build-arg https_proxy=${https_proxy} \
		--build-arg no_proxy=${no_proxy} \
		--file $(DIR)/Dockerfile-$(panel_version) \
		--tag $(DOCKER_IMAGE):$(panel_version) \
		$(DIR)
	@[ "$(panel_version)" = "$(LATEST_PANEL_VERSION)" ] && docker tag $(DOCKER_IMAGE):$(panel_version) $(DOCKER_IMAGE):latest || true

push: ## Push Pterodactyl daemon to docker hub
	@$(eval panel_version := $(or $(p),$(LATEST_PANEL_VERSION)))
	@$(MAKE) build p=$(panel_version)
	@docker push $(DOCKER_IMAGE):$(panel_version)
	@[ "$(panel_version)" = "$(LATEST_PANEL_VERSION)" ] && docker push $(DOCKER_IMAGE):latest || true

run: ## Run Pterodactyl panel
	@$(eval panel_version := $(or $(p),$(LATEST_PANEL_VERSION)))
	@$(MAKE) build p=$(panel_version)
	@docker run -it --rm \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-e no_proxy=${no_proxy} \
		-e DEBUG_LEVEL=DEBUG \
		$(DOCKER_IMAGE):$(panel_version)

shell: ## Prompt shell into Pterodactyl panel
	@$(eval panel_version := $(or $(p),$(LATEST_PANEL_VERSION)))
	@$(MAKE) build p=$(panel_version)
	@docker run -it --rm \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-e no_proxy=${no_proxy} \
		-e DEBUG_LEVEL=DEBUG \
		$(DOCKER_IMAGE):$(panel_version) \
		bash

remove: ## Remove all generated images
	@docker images | grep $(DOCKER_IMAGE) | tr -s ' ' | cut -d ' ' -f 2 | xargs -I {} docker rmi $(DOCKER_IMAGE):{} || true
	@docker images | grep $(DOCKER_IMAGE) | tr -s ' ' | cut -d ' ' -f 3 | xargs -I {} docker rmi {} || true
