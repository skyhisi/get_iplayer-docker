FROM docker.io/library/debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    perl libwww-perl liblwp-protocol-https-perl libmojolicious-perl libxml-libxml-perl libcgi-pm-perl \
    ffmpeg atomicparsley curl uuid-runtime coreutils procps
RUN curl -Lsfo /usr/local/bin/get_iplayer \
    "https://raw.githubusercontent.com/get-iplayer/get_iplayer/master/get_iplayer" && \
    chmod a+x /usr/local/bin/get_iplayer
