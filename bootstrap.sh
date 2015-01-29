#!/bin/bash

mkdir -p /opt/rocketpanel-docker/
cd /opt/rocketpanel-docker/
curl -sS https://codeload.github.com/dnl-jst/rocketpanel-docker/tar.gz/master | tar xz --strip 1

./install.sh
