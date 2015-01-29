#!/bin/bash
apt-get -qq -y update
apt-get -qq -y dist-upgrade
apt-get -qq -y install apt-transport-https
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo "deb https://get.docker.com/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
apt-get -qq -y update
apt-get -qq -y install lxc-docker
