# syntax=docker/dockerfile:1.7
ARG base_tag=stable-slim
FROM docker.io/library/debian:${base_tag}
ENV DEBIAN_FRONTEND=noninteractive
ARG get_iplayer_tag=v3.36
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    perl libwww-perl liblwp-protocol-https-perl libmojolicious-perl libxml-libxml-perl libcgi-pm-perl \
    ffmpeg atomicparsley curl uuid-runtime coreutils procps && \
    rm -rf /var/lib/apt/lists/*
RUN curl -Lsfo /usr/local/bin/get_iplayer \
    "https://raw.githubusercontent.com/get-iplayer/get_iplayer/${get_iplayer_tag}/get_iplayer" && \
    chmod a+x /usr/local/bin/get_iplayer
