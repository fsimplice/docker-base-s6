#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-__IMAGE_TAG__}
echo "Testing image ${image}"

OPTS="-test.v -test.timeout 60s"
${CONTAINER_TEST_BIN_PATH:-../../..}/container-structure-test ${OPTS}  -image ${image} ${CONTAINER_TEST_FILE_PATH:-../../..}/structure-test/tests-${ARCH:-__ARCH__}.yaml
