#!/bin/bash

#export DEBIAN_FRONTEND=noninteractive

echo ">>> adding Wine dependencies if missing... "
apt-get -qq -y install wine winbind winetricks 
dpkg --add-architecture i386  > /dev/null
apt-get -qq update  > /dev/null
apt-get -qq -y install wine32 > /dev/null

echo ">>> adding wine32 environment: ./winefzb..."
WINEPREFIX="/root/.winefzb" WINEARCH=win32 wine wineboot 

echo ">>> adding wine32 environment: ./winefzb..."
whoami
export WINEPREFIX="/root/.winefzb" 
echo "export WINEPREFIX=/root/.winefzb" >> /root/.bashrc
source /root/.bashrc

echo ">>> creating reg file fzb.reg..."
cat <<EOF > /root/fzb.reg
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Environment]
"PATH"="Value: c:\\\\windows;c:\\\\windows\\\\system;C:\\\\Python26;C:\\\\fuzzbunch-debian\\\\windows\\\\fuzzbunch"
"TEMP"="C:\\users\\root\\Temp"
"TMP"="C:\\users\\root\\Temp"
EOF

echo ">>> importing regkey..."
WINEPREFIX="/root/.winefzb" wine regedit /S /root/fzb.reg

echo ">>> cloning fuzzbunch repo..."
if [[ -e /root/.winefzb/drive_c/fuzzbunch-debian ]]; then
    echo ">>> SKIP: fuzzbunch repo already exists."
else
    git clone https://github.com/mdiazcl/fuzzbunch-debian.git /root/.winefzb/drive_c/fuzzbunch-debian
fi

echo ">>> fuzzbunch cloned to /root/.winefzb/drive_c"

echo "*** To finish fuzzbunch installation, login and run:"
echo "winetricks python26"
echo " "

#THIS WON"T WORK !!!! :(
#cd /root/.winefzb/drive_c
#WINEPREFIX="/root/.winefzb" winetricks python26 /q

#THIS WON"T WORK !!!! :(
#wget -qO /root/.winefzb/drive_c/python-2.6.2.msi https://www.python.org/ftp/python/2.6.2/python-2.6.2.msi
#WINEPREFIX="/root/.winefzb" wine msiexec -i "c:\python-2.6.2.msi TARGETDIR=C:\Python26 ALLUSERS=1 /q"


