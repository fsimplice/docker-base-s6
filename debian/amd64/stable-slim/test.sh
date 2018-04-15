#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-debian_stable-slim}
echo "Testing image ${image}"

OPTS="test --verbose "
${CONTAINER_TEST_BIN_PATH:-../../..}/container-structure-test ${OPTS}  --image ${image} --config ${CONTAINER_TEST_FILE_PATH:-../../..}/structure-test/tests-${ARCH:-amd64}.yaml
