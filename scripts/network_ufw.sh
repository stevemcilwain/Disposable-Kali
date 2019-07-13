#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

allowed=$1

if [[ -z $allowed ]]; then
    echo ">>> ABORT: allowed ports missing from first argument "
    exit 0
fi

echo ">>> installing ufw packages..."
apt-get -qq -y install ufw > /dev/null
apt-get -qq -y install gufw > /dev/null

echo ">>> adding rules for: $allowed"
ufw allow $allowed

echo " "
ufw status 
echo " "
