#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-debian_stable-slim}
echo "Running image ${image}"

docker run --rm --name  debian_stable-slim -it  ${image} /bin/sh
