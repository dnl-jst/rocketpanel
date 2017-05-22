#!/bin/bash
apt-get -qq -y update

# install docker
wget -qO- https://get.docker.com/ | sh

# try to remove old rocketpanel-updater instance
docker rm -f rocketpanel-updater

# pull latest rocketpanel-updater
docker pull rocketpanel-updater 

# create update container which will install all necessary containers
docker run -d --rm \
	--name rocketpanel-updater \
	-v /opt/rocketpanel:/opt/rocketpanel \
	-v /var/run/docker.sock:/var/run/docker.sock \
	dnljst/rocketpanel-updater
