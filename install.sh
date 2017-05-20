#!/bin/bash

apt-get -qq -y update

apt-get -qq -y install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

wget -qO- https://get.docker.com/ | sh
