#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Please run this script as root."
    exit
fi

### START ROLE-SPECIFIC TASKS
### END ROLE-SPECIFIC TASKS


pkill -u vagrant

ifconfig eth1 down
ifconfig eth0 down
mv /etc/netplan/50-vagrant.yaml /etc/netplan/01-netcfg.yaml
sed 's/eth1/eth0/g' -i /etc/netplan/01-netcfg.yaml
netplan apply
ifconfig eth0 up

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