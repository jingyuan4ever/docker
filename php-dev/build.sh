#! /usr/bin/env bash
source ./web_site.conf
cp -r template $DOCKER_WEB_APP
cd $DOCKER_WEB_APP
sed -i "" "s/DOCKER_WEB_APP/$DOCKER_WEB_APP/g" docker-compose.yml
sed -i "" "s/DOCKER_WEB_PORT/$DOCKER_WEB_PORT/g" docker-compose.yml
docker-compose up &
