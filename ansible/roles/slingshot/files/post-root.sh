#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Please run this script as root."
    exit
fi

### START ROLE-SPECIFIC TASKS
### END ROLE-SPECIFIC TASKS

# Kill any processes associated with vagrant user
pkill -u vagrant

# Remove vagrant network adapter
rm /etc/netplan/50-vagrant.yaml
netplan apply

# Clean apt cache
apt clean

# Remove vagrant user and vagrant directory
userdel -r vagrant
rm /vagrant

# Clean up unnecessary files
rm -rf /tmp/*
rm -rf /var/state
rm -rf /var/lib/apt/lists/*
find /var/log -type f -exec cp /dev/null {} \;

# Disable SSH service
systemctl disable ssh

# Create/update man database
mandb -c

# Update filename database
updatedb

# Clear bash history
history -c

# Remove this script
cd ~
rm -- "$0"