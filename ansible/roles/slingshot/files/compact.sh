#!/bin/bash
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Please run this script as root."
    exit
fi

dd if=/dev/zero of=/bigemptyfile bs=1M
sync
rm -f /bigemptyfile
rm -- "$0"