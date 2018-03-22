#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-alpine_latest}
echo "Testing image ${image}"

${CONTAINER_TEST_BIN_PATH:-../../..}/container-structure-test -image ${image} ${CONTAINER_TEST_FILE_PATH:-../../..}/structure-test/tests-${ARCH:-amd64}.yaml
