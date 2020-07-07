# Post-Install

## Prep VM

1. Remove `sudo rm /etc/netplan/50-vagrant.yaml`
1. Shut down the machine - `vagrant halt`
1. Remove the second network adapter - VMWare GUI
1. Restart the machine - VMWare GUI
1. Log in as the `slingshot` user
1. Remove the vagrant user: `sudo userdel -r vagrant`
1. Remove the contents of /tmp: `sudo rm -rf /tmp/*`
1. Remove logs: `sudo find /var/log -type f -exec cp /dev/null {} \;`
1. Remove /var/state/: `sudo rm -rf /var/state`
1. ~~Zero unused disk space - optional: `sudo dd if=/dev/zero of=/bigemptyfile ; sudo rm -f /bigemptyfile`~~
1. Clear bash history for root and main user: `history -c`

After restarting and logging in as `slingshot`, run the following:

```bash
sudo userdel -r vagrant
sudo rm -rf /tmp/*
sudo rm -rf /var/state
sudo find /var/log -type f -exec cp /dev/null {} \;
history -c
```

## Export .ova

1. Make sure the box is shut down
2. Within VMWare Workstation / Fusion Pro, choose `File->Export to OVF...`
3. Choose `Export as OVA (single-file archive)`

Or, export using `ovftool` ... and tab completion

```bash
ovftool --name=slingshot -st=vmx -tt=ova ./.vagrant/machines/slingshot/vmware_fusion/d303fb95-5d10-4ffb-a201-af4d62baa90a/ubuntu-18.04-amd64.vmx /Users/Shared/SROC/slingshot-20200705.ova
```

OVA is basically just a .tar of the OVF directory.
