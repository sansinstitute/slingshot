# Post-Install

## Prep VM
1. Remove /etc/netplan/50-vagrant.yaml
* Shut down the machine
* Change the first network adapter to Private to My Mac / Host-Only (class VMs only)
* Remove the second network adapter
* Restart the machine
* Remove the vagrant user: `userdel -r vagrant`
* Remove the contents of /tmp: `rm -rf /tmp/*`
* Remove logs: `find /var/log -type f -exec cp /dev/null {} \;`
* Remove /var/state/: `rm -rf /var/state`
* Zero unused disk space: `dd if=/dev/zero of=/bigemptyfile && rm -f /bigemptyfile`
* Clear bash history for root and main user: `history -c`

## Export .ova
1. Make sure the box is shut down
2. Within VMWare Workstation / Fusion Pro, choose `File->Export to OVF...`
3. Choose `Export as OVA (single-file archive)`

OVA is basically just a .tar of the OVF directory.