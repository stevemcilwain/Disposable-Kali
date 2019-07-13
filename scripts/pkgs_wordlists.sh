#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo ">>> adding seclists package to /usr/share/seclists..."
apt-get -qq -y install seclists > /dev/null

echo ">>> unzipping rockyou..."
if [[ -e /usr/share/wordlists/rockyou.txt ]]; then
    echo ">>> SKIP: already extracted rockyou."
else
    gunzip -q -k /usr/share/wordlists/rockyou.txt.gz
fi
