#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-alpine_3.7}
echo "Running image ${image}"

docker run --rm --name  alpine_3.7 -it  ${image} /bin/sh
