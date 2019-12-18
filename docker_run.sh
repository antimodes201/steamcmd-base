#!/bin/bash
# Sample run script.  Primarly used in build / testing

docker rm ${APP}
docker run -it -p ${UDP_PORTS}:${UDP_PORTS}/udp -p ${TCP_PORTS} -v /app/docker/temp-vol:${APPDIR} \
-e INSTANCE_NAME="T3stN3t Test" \
--name ${APP} \
antimodes201/${APP}-server:latest
