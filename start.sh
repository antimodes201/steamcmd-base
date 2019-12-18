#!/bin/bash

# Generic Start Script

/steamcmd/steamcmd.sh +login anonymous +force_install_dir /${APPDIR} +app_update ${APPID} +quit

# Insert start command for server here.