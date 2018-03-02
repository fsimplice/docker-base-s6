#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-debian_stretch-slim}
echo "Running image ${image}"

docker run --rm --name  debian_stretch-slim -it  ${image} /bin/sh
