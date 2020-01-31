#!/bin/bash

# Generic Start Script
APPID=

/steamcmd/steamcmd.sh +login anonymous +force_install_dir /app +app_update ${APPID} +quit

# Insert start command for server here.

