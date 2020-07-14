#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Please run this script as root."
    exit
fi

### START ROLE-SPECIFIC TASKS
### END ROLE-SPECIFIC TASKS


pkill -u vagrant

rm /etc/netplan/50-vagrant.yaml
netplan apply

userdel -r vagrant

apt clean

rm /vagrant
rm -rf /tmp/*
rm -rf /var/state
rm -rf /var/lib/apt/lists/*

find /var/log -type f -exec cp /dev/null {} \;

systemctl disable ssh

updatedb

history -c

cd ~
rm -- "$0"