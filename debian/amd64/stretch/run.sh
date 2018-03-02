#!/usr/bin/env sh

image=${REPO:-build}/${IMAGE:-baseimage}:${TAG:-debian_stretch}
echo "Running image ${image}"

docker run --rm --name  debian_stretch -it  ${image} /bin/sh
