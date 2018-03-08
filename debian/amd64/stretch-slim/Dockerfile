ARG S6_OVERLAY_VERSION=v1.21.2.2
ARG S6_OVERLAY_ARCH=amd64

FROM debian:stretch-slim
ARG S6_OVERLAY_VERSION
ARG S6_OVERLAY_ARCH

COPY rootfs /

#RUN apt-get update
#RUN apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN echo -e "debian:stretch-slim\n$S6_OVERLAY_VERSION $S6_OVERLAY_ARCH" > /s6_version.txt

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-${S6_OVERLAY_ARCH}.tar.gz /tmp
RUN tar xzvf /tmp/s6-overlay-${S6_OVERLAY_ARCH}.tar.gz -C / && rm -rf /tmp/s6-overlay-${S6_OVERLAY_ARCH}.tar.gz

VOLUME /data
ENTRYPOINT ["/init"]
