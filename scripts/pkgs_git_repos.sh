#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo ">>> cloning AutoRecon and dependencies ..."

if [[ -e /opt/AutoRecon ]]; then
    echo ">>> SKIP: already cloned."
else
    apt-get -qq -y install seclists > /dev/null
    git clone https://github.com/Tib3rius/AutoRecon.git /opt/AutoRecon
fi

echo ">>> cloning AutoBlue..."

if [[ -e /opt/AutoBlue ]]; then
    echo ">>> SKIP: already cloned."
else
 git clone https://github.com/3ndG4me/AutoBlue-MS17-010.git /opt/AutoBlue
fi

echo ">>> cloning LinEnum..."

if [[ -e /opt/LinEnum ]]; then
    echo ">>> SKIP: already cloned."
else
    git clone https://github.com/rebootuser/LinEnum.git /opt/LinEnum
fi

echo ">>> cloning Windows Enum NG..."

if [[ -e /opt/wesng ]]; then
    echo ">>> SKIP: already cloned."
else
    git clone https://github.com/bitsadmin/wesng.git /opt/wesng
fi

echo ">>> cloning JAWS..."

if [[ -e /opt/JAWS ]]; then
    echo ">>> SKIP: already cloned."
else
    git clone https://github.com/411Hall/JAWS.git /opt/JAWS
fi

echo ">>> cloning Linux Exploit Suggester 2..."

if [[ -e /opt/linux-exploit-suggester-2 ]]; then
    echo ">>> SKIP: already cloned."
else
    git clone https://github.com/jondonas/linux-exploit-suggester-2.git /opt/linux-exploit-suggester-2
fi

echo ">>> cloning NMap Bootstrap XSL..."

if [[ -e /opt/nmap-bootstrap-xsl ]]; then
    echo ">>> SKIP: already cloned."
else
    git clone https://github.com/honze-net/nmap-bootstrap-xsl.git /opt/nmap-bootstrap-xsl
fi

echo ">>> cloning AutoNSE..."

if [[ -e /opt/AutoNSE ]]; then
    echo ">>> SKIP: already cloned."
else
    git clone https://github.com/m4ll0k/AutoNSE /opt/AutoNSE
fi
