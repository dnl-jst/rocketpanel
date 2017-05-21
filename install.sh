#!/bin/bash
apt-get -qq -y update

# install docker
wget -qO- https://get.docker.com/ | sh

# create mysql data directory
mkdir -p /opt/rocketpanel/mysql/data/

# create logs directory
mkdir -p /opt/rocketpanel/logs

# create vhosts directory
mkdir -p /opt/rocketpanel/vhosts

# generate root password
date +%s | sha256sum | base64 | head -c 32 > /opt/rocketpanel/.rocketpanel-mysql-root-password

# create update container which will install all necessary containers
docker run -d --rm \
	--name rocketpanel-updater \
	-v /opt/rocketpanel:/opt/rocketpanel \
	-v /var/run/docker.sock:/var/run/docker.sock \
	dnljst/rocketpanel-updater
