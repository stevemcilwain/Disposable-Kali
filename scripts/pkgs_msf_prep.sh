#!/bin/bash

if [[ -e /tmp/msf_prep ]]; then
    echo ">>> SKIP: msf already prepped "
else
    echo ">>> setting up postgresql db..."
    systemctl start postgresql 
    systemctl enable postgresql 
    msfdb init 

    touch  /tmp/msf_prep
fi
