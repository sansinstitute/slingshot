#!/bin/bash
if [ $(/usr/bin/id -u) -eq 0 ]; then
    echo "Please run this script as the default user."
    exit
fi

### START ROLE-SPECIFIC TASKS
### END ROLE-SPECIFIC TASKS

cd ~
rm -- "$0"
