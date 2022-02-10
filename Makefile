DOCKER ?= docker
DOCKER_COMPOSE ?= docker-compose
KUBECTL ?= kubectl


all: build

# Docker related commands
up: build-app
	$(DOCKER_COMPOSE) up -d --build api

down:
	$(DOCKER_COMPOSE) down

migrate:
	$(DOCKER) exec application_api_1 npm run seed

build-app:
	$(DOCKER) build -t application_api -f Dockerfile .

build-app:
	$(DOCKER) build -t application_api -f Dockerfile .
	
build: build-app
	$(DOCKER) build -t application_api -f Dockerfile .


# Kubernetes related commands
kube-build:
	./scripts/build-images-in-gcc.sh

kube-deploy: kube-build
	$(KUBECTL) apply -f deploy/

kube-migrate:
	./scripts/run-migrate-in-pod.sh

kube-delete:
	$(KUBECTL) delete -f deploy/

# General utilities
clean-db:
	sudo rm -rf ./pgdata

clean: clean-db
	rm -rf node_modules npm-debug.log


.PHONY: up, down, migrate, build-app, build, kube-build, kube-deploy, kube-migrate, kube-delete, clean-db, clean
