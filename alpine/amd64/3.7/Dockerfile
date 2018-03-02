ARG S6_OVERLAY_VERSION=v1.21.2.2
ARG S6_OVERLAY_ARCH=amd64

FROM alpine:3.7
ARG S6_OVERLAY_VERSION
ARG S6_OVERLAY_ARCH

RUN echo -e "alpine:3.7\n$S6_OVERLAY_VERSION $S6_OVERLAY_ARCH" > /s6_version.txt

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-${S6_OVERLAY_ARCH}.tar.gz /

ADD rootfs /

ENTRYPOINT ["/init"]