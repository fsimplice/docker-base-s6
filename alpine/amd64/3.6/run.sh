#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-alpine_3.6}
echo "Running image ${image}"

docker run --rm --name  alpine_3.6 -it  ${image} /bin/sh
