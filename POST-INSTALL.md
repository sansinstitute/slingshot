# Post-Install

## Prep VM

1. Remove `/etc/netplan/50-vagrant.yaml`
1. Shut down the machine - `vagrant halt`
1. Remove the second network adapter - VMWare GUI
1. Restart the machine - VMWare GUI
1. Remove the vagrant user: `userdel -r vagrant`
1. Remove the contents of /tmp: `rm -rf /tmp/*`
1. Remove logs: `find /var/log -type f -exec cp /dev/null {} \;`
1. Remove /var/state/: `rm -rf /var/state`
1. Zero unused disk space: `dd if=/dev/zero of=/bigemptyfile && rm -f /bigemptyfile`
1. Clear bash history for root and main user: `history -c`

## Export .ova

1. Make sure the box is shut down
2. Within VMWare Workstation / Fusion Pro, choose `File->Export to OVF...`
3. Choose `Export as OVA (single-file archive)`

OVA is basically just a .tar of the OVF directory.
