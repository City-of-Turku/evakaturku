# syntax=docker/dockerfile:1.5.2-labs
# SPDX-FileCopyrightText: 2021 City of Turku
#
# SPDX-License-Identifier: LGPL-2.1-or-later

FROM eclipse-temurin:21-jre-jammy

LABEL maintainer="https://github.com/City-of-Turku"

# Increment this if we ever explicitly want to e.g. run apt-get upgrade
ARG CACHE_BUST=2022-11-08

# Use bash instead of dash
SHELL ["/bin/bash", "-c"]

# Install required packages and update time zone information
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
RUN set -euxo pipefail \
    && apt-get update \
    && apt-get -y dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        tzdata \
        ca-certificates \
        curl \
        jq \
    && ln -fs /usr/share/zoneinfo/Europe/Helsinki /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/*

# Set evaka username
ENV USERNAME evaka
ENV HOME_DIR /home/${USERNAME}
ENV USER_ID 1000

# Create a new user named evaka which should be used to run any software.
RUN adduser ${USERNAME} --gecos "" -q --home ${HOME_DIR} --uid ${USER_ID} --disabled-password

# Used for downloading keys from S3
ADD --chown=evaka:evaka --chmod=0700 \
    --checksum=sha256:520ea232e83a7cefe2a87d4f2af8433e383a4351464e213b7dd3b78ca0dc200f \
    https://github.com/espoon-voltti/s3-downloader/releases/download/v1.4.1/s3downloader-linux-amd64 \
    /usr/local/bin/s3download

USER evaka
WORKDIR /home/evaka

COPY --chown=evaka:evaka "entrypoint.sh" "entrypoint.sh"
COPY --chown=evaka:evaka "target/dependencies/" "./"
COPY --chown=evaka:evaka "target/spring-boot-loader/" "./"
COPY --chown=evaka:evaka "target/snapshot-dependencies/" "./"
COPY --chown=evaka:evaka "target/application/" "./"

# Add build and commit environment variables and labels
# for tracing the image to the commit and build from which the image has been built.
ARG build=none
ARG commit=none
ENV APP_BUILD "$build"
ENV APP_COMMIT "$commit"
LABEL fi.turku.build="$build" \
      fi.turku.commit="$commit"

EXPOSE 8888

ENTRYPOINT ["./entrypoint.sh"]
