#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo ">>> adding XFCE4..."

apt-get -qq -y install xfce 
apt-get -qq -y xfce4-places-plugin
apt-get -qq -y xfce4-goodies

