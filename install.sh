#!/bin/bash

apt-get -qq -y update

apt-get -qq -y install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

wget -qO- https://get.docker.com/ | sh

docker pull dnljst/rocketpanel-control
docker run -e "WEB_DOCUMENT_ROOT=/app/web" -v /opt/rocketpanel/:/rocketpanel -d -p 8443:443 --name rocketpanel-control dnljst/rocketpanel-control