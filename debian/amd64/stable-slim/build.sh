#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-debian_stable-slim}

echo "Using BUILD_OPTS=${BUILD_OPTS}"
echo "Building ${image}"

docker build \
    --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
    --build-arg VCS_REF=`git rev-parse --short HEAD` \
    ${BUILD_OPTS} . -t ${image}