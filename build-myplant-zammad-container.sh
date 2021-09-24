#!/usr/bin/env bash
#
# build zammads docker & docker-compose images

set -o errexit
set -o pipefail

DOCKER_IMAGES="zammad zammad-elasticsearch zammad-postgresql"
TAG_DATE="$(date -u +'%Y%m%d%H%M%S')"

# shellcheck disable=SC2153
for DOCKER_IMAGE in ${DOCKER_IMAGES}; do
  echo "Build Zammad Docker image ${DOCKER_IMAGE} for local or ci tests"
  docker build --pull --no-cache --build-arg BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" -t "334450016200.dkr.ecr.us-east-1.amazonaws.com/zammad:${DOCKER_IMAGE}-${TAG_DATE}" -f "containers/${DOCKER_IMAGE}/Dockerfile" .
done
