#!/bin/bash

size=$1

if [[ -z $size ]]; then
    echo ">>> ABORT: swapfile size in GB must be passed as the first script argument "
    exit 0
fi

if [[ -e /swapfile ]]; then
    echo ">>> SKIP: swapfile already exists "
else
    echo ">>> allocating $size GB swapfile... "
    fallocate -l ${size}G /swapfile > /dev/null

    echo ">>> setting permissions... "
    chown root:root /swapfile > /dev/null
    chmod 0600 /swapfile > /dev/null

    echo ">>> making swap..."
    mkswap /swapfile > /dev/null
    swapon /swapfile > /dev/null

    echo ">>> saving in fstab... "
    cp /etc/fstab /etc/fstab.bak
    echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab

    echo " "
    swapon
    echo " "

fi


