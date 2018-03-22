#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-alpine_3.7}
echo "Testing image ${image}"

${CONTAINER_TEST_BIN_PATH:-../../..}/container-structure-test -image ${image} ${CONTAINER_TEST_FILE_PATH:-../../..}/structure-test/tests-${ARCH:-amd64}.yaml
