#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo ">>> cloning git repos into /opt..."
echo " "

echo ">>> cloning AutoRecon and dependencies ..."
apt-get -qq -y install seclists > /dev/null
git clone https://github.com/Tib3rius/AutoRecon.git /opt/AutoRecon

echo ">>> cloning AutoBlue..."
git clone https://github.com/3ndG4me/AutoBlue-MS17-010.git /opt/AutoBlue

echo ">>> cloning LinEnum..."
git clone https://github.com/rebootuser/LinEnum.git /opt/LinEnum

echo ">>> cloning Windows Enum NG..."
git clone https://github.com/bitsadmin/wesng.git /opt/wesng
