#!/bin/bash

# Add 32-bit archictecture

dpkg --add-architecture i386

# Get the latest system updates

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

# Clean up

apt-get autoremove -y

# Add Kali Metapackages

apt-get install -y  kali-linux-large \ 
kali-tools-web \
kali-tools-passwords \
kali-tools-post-exploitation \
kali-tools-crypto-stego \
kali-tools-windows-resources

# Clean up

apt-get autoremove -y

# Add essential packages
apt-get install -y ufw gufw rlwrap lftp bettercap fonts-powerline crackmapexec xclip
apt-get install -y seclists gobuster

# Add packages for cross-compiling and exploits

apt-get install -y gcc-multilib g++-multilib \
python-pip python-smb python-pyftpdlib PyWebDAV3 php-curl \

# Add packages for Windows Emulation

apt-get install -y wine winetricks winbind wine32 

# Setup wine

wine cmd.exe /c dir
winetricks python27
wine pip.exe install pyinstaller

# Prep lists

wget -nd -P /opt/crackstation https://crackstation.net/files/crackstation-human-only.txt.gz
gunzip /opt/crackstation/crackstation-human-only.txt.gz
gunzip -q -k /usr/share/wordlists/rockyou.txt.gz

# Prep metasploit
systemctl start postgresql 
systemctl enable postgresql 
msfdb init 

# Clone Repos

git clone https://github.com/Tib3rius/AutoRecon.git /opt/AutoRecon
git clone https://github.com/jondonas/linux-exploit-suggester-2.git /opt/linux-exploit-suggester-2
git clone https://github.com/rebootuser/LinEnum.git /opt/LinEnum
git clone https://github.com/bitsadmin/wesng.git /opt/wesng
git clone https://github.com/411Hall/JAWS.git /opt/JAWS
git clone https://github.com/abatchy17/WindowsExploits.git /opt/WindowsExploits
git clone https://github.com/3ndG4me/AutoBlue-MS17-010.git /opt/AutoBlue
git clone https://github.com/m4ll0k/AutoNSE /opt/AutoNSE
git clone https://github.com/SecWiki/linux-kernel-exploits.git /opt/linux-kernel-exploits
git clone https://github.com/SecWiki/windows-kernel-exploits.git /opt/windows-kernel-exploits
git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/linux-smart-enumeration
git clone https://github.com/ThePacketBender/pentest_scripts.git /opt/pentest_scripts
git clone https://github.com/M4ximuss/Powerless.git /opt/powerless
git clone https://github.com/andrew-d/static-binaries.git /opt/static-binaries
git clone https://github.com/AlessandroZ/BeRoot.git /opt/beroot


# Download Stuff

wget -nd -P /opt/accesschk https://web.archive.org/web/20071007120748if_/http://download.sysinternals.com/Files/Accesschk.zip
unzip /opt/accesschk/Accesschk.zip -d /opt/accesschk

wget -nd -P /opt/tilix https://github.com/gnunn1/tilix/releases/download/1.9.3/tilix.zip
unzip /opt/tilix/tilix.zip -d /
glib-compile-schemas /usr/share/glib-2.0/schemas/

# Host Linux Files

mkdir /srv/linux

ln -s /opt/LinEnum/LinEnum.sh /srv/linux/linenum.sh
ln -s /usr/share/unix-privesc-check/unix-privesc-check /srv/linux/upc
ln -s /opt/linux-exploit-suggester-2/ /srv/linux/les2.pl
ln -s /opt/linux-smart-enumeration/lse.sh /srv/linux/lse.sh

# Host Windows Files

mkdir /srv/windows

ln -s /opt/accesschk/accesschk.exe /srv/windows/accesschk.exe
ln -s /opt/sysinternals/ /srv/windows/sysinternals
ln -s /usr/share/windows-resources/powersploit/ /srv/windows/powersploit
ln -s /usr/share/nishang/ /srv/windows/nishang
ln -s /opt/JAWS/jaws-enum.ps1 /srv/windows/jaws.ps1
ln -s /usr/share/windows-resources/binaries/nc.exe /srv/windows/nc.exe
ln -s /opt/beroot/beRoot.exe /srv/windows/beroot.exe
ln -s /usr/share/windows-resources/mimikatz/ /srv/windows/mimikatz
ln -s /opt/powerless/Powerless.bat /srv/windows/pless.bat

# Host RFI

mkdir /srv/rfi
echo "<html><body><p>PHP INFO PAGE</p><br /><?php phpinfo(); ?></body></html>" > /srv/rfi/phpinfo.php

# Update indexing

updatedb

# Install OH-My-ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
