DOCKER ?= docker
DOCKER_COMPOSE ?= docker-compose
KUBECTL ?= kubectl


all: build

# Docker related commands
up: build-app
	$(DOCKER_COMPOSE) up -d --build api

down:
	$(DOCKER_COMPOSE) down

build-app:
	./bash/push_images.sh

# Kubernetes related commands

kube-deploy:
	$(KUBECTL) apply -f deploy/

kube-migrate:
	./bash/run-migrate-in-pod.sh

kube-delete:
	$(KUBECTL) delete -f deploy/

# General utilities

clean: clean-db
	rm -rf node_modules npm-debug.log


.PHONY: up, down, build-app, kube-deploy, kube-migrate, kube-delete, clean
