#!/bin/bash

#export DEBIAN_FRONTEND=noninteractive

echo ">>> updating and upgrading... go make a sammich."

apt-get -qq update > /dev/null
#apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade > /dev/null
apt-get -y upgrade
apt-get -qq -y autoremove > /dev/null

