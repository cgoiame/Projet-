#!/bin/bash
GIT_COMMIT=$(git rev-parse --short HEAD)
docker build -t application_api:${GIT_COMMIT} -f Dockerfile .
docker tag application_api:${GIT_COMMIT}  younes925/application_api:${GIT_COMMIT}
docker push younes925/application_api:${GIT_COMMIT}