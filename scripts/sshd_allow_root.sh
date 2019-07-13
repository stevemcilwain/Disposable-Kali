#!/bin/bash

if [[ -e /tmp/sshd_allow_root_login ]]; then
    echo ">>> SKIP: root login already allowed."
else
    echo ">>> Updating sshd_config..."
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    touch /tmp/sshd_allow_root_login 
    echo ">>> Restarting sshd..."
    systemctl restart sshd
    echo " "
    cat /etc/ssh/sshd_config | grep "PermitRootLogin"
    echo " "
fi


