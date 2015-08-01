#!/bin/bash
apt-get -qq -y update
apt-get -qq -y install linux-image-generic-lts-trusty
wget -qO- https://get.docker.com/ | sh
