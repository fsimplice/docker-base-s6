#!/usr/bin/env sh

echo "Using BUILD_OPTS=${BUILD_OPTS}"
docker build ${BUILD_OPTS} . -t build/baseimage:alpine_3.6