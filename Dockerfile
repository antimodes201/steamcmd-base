FROM ubuntu:18.04
# Find and Replace app with whatever the current project is

MAINTAINER antimodes201

# quash warnings
ARG DEBIAN_FRONTEND=noninteractive

# Set some Variables
ENV TZ "America/New_York"

# dependencies
RUN dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get install -y --no-install-recommends \
                lib32gcc1 \
                wget \
                unzip \
                tzdata \
                wine-stable \
                xvfb \
                ca-certificates && \
                rm -rf /var/lib/apt/lists/*

# create directories
RUN adduser \
    --disabled-login \
    --disabled-password \
    --shell /bin/bash \
    steamuser && \
    usermod -G tty steamuser \
        && mkdir -p /steamcmd \
        && mkdir -p /app \
                && mkdir -p /scripts \
        && chown steamuser:steamuser /app \
        && chown steamuser:steamuser /steamcmd \
        && chown steamuser:steamuser /scripts

# Install Steamcmd
USER steamuser
RUN cd /steamcmd && \
        wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
        tar -xf steamcmd_linux.tar.gz && \
        rm steamcmd_linux.tar.gz && \
        /steamcmd/steamcmd.sh +quit

# Make a volume
# contains app, configs, and saves
VOLUME /app

