
# https://hub.docker.com/_/alpine/tags
FROM alpine:3.24.0

# https://pkgs.alpinelinux.org/packages?name=samba&branch=v3.23&repo=&arch=x86_64&origin=&flagged=&maintainer=
ENV sambaV="samba=~4.23.8-r0"

LABEL org.opencontainers.image.authors="rardcode <sak37564@ik.me>"
LABEL Description="Chrony server based on Alpine."

ENV APP_NAME="sambafs"

RUN set -xe && \
  : "---------- ESSENTIAL packages INSTALLATION ----------" && \
  apk update --no-cache && \
  apk upgrade --available && \
  apk add bash

RUN set -xe && \
  : "---------- SPECIFIC packages INSTALLATION ----------" && \
  apk update --no-cache && \
  apk add --upgrade samba-common-tools && \
  apk add --upgrade ${sambaV}

ADD rootfs /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["smbd", "-F", "--no-process-group", "--debug-stdout", "-d", "3", "--configfile=/data/smb.conf"]
