#!/bin/bash
apt-get -qq -y update

# install docker
wget -qO- https://get.docker.com/ | sh

# create mysql data directory
mkdir -p /opt/rocketpanel/mysql/data/

# create vendor directory
mkdir /app/vendor/

# create main mysql container
docker run -d \
	--name rocketpanel-mysql \
	-e "MYSQL_ROOT_PASSWORD=rootpass" \
	-e "MYSQL_DATABASE=rocketpanel" \
	-v /opt/rocketpanel/mysql/data/:/var/lib/mysql \
	mysql:5.7

# create rocketpanel control container
docker run -d \
	--name rocketpanel-control \
	--link rocketpanel-mysql:mysql \
	-e "WEB_DOCUMENT_ROOT=/app/web" \
	-v /opt/rocketpanel/:/opt/rocketpanel \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-p 8443:443 \
	dnljst/rocketpanel-control

