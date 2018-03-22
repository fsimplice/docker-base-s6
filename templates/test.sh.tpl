#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-__IMAGE_TAG__}
echo "Testing image ${image}"

${CONTAINER_TEST_BIN_PATH:-../../..}/container-structure-test -image ${image} ${CONTAINER_TEST_FILE_PATH:-../../../container-tests/tests-${ARCH:-__ARCH__}.yaml