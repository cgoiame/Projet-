#!/bin/bash
GIT_COMMIT="v2"
# GIT_COMMIT="prod"
DOCKER_REPO="cedricgo"
docker build -t application_api:${GIT_COMMIT} -f Dockerfile .
docker tag application_api:${GIT_COMMIT}  ${DOCKER_REPO}/application_api:${GIT_COMMIT}
docker push ${DOCKER_REPO}/application_api:${GIT_COMMIT}
