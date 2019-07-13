#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo ">>> adding wine packages"

apt-get -qq -y install wine > /dev/null
apt-get -qq -y install winetricks > /dev/null
dpkg --add-architecture i386 > /dev/null
apt-get -qq update > /dev/null
apt-get -qq -y install wine32 > /dev/null

echo "--- $SCRIPT completed "

