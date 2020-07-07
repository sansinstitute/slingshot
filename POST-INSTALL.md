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

### Command Line Approach - macOS / Fusion

```bash
vagrant ssh slingshot -c "sudo rm -f /etc/netplan/50-vagrant.yaml"
vagrant halt slingshot

export SLINGSHOT_VMX=$(find .vagrant/machines/slingshot -type f -name \*vmx | head -1)
export SLINGSHOT_RM_NIC=$(vmrun -T fusion listNetworkAdapters "${SLINGSHOT_VMX}" | grep bridged | awk '{print $1}')
vmrun -T fusion deleteNetworkAdapter "${SLINGSHOT_VMX}" "${SLINGSHOT_RM_NIC}"
vmrun -T fusion start "${SLINGSHOT_VMX}"

export SLINGSHOT_IP=$(vmrun -T fusion getGuestIPAddress "${SLINGSHOT_VMX}" -wait)
echo ${SLINGSHOT_IP}

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null slingshot@${SLINGSHOT_IP}
```

Now that you're logged in as `slingshot`, run the following:

```bash
sudo userdel -r vagrant
sudo rm -rf /tmp/*
sudo rm -rf /var/state
sudo find /var/log -type f -exec cp /dev/null {} \;
history -c
exit
```

## Export .ova

1. Make sure the box is shut down
2. Within VMWare Workstation / Fusion Pro, choose `File->Export to OVF...`
3. Choose `Export as OVA (single-file archive)`

Or, export using `ovftool`

```bash
vmrun -T fusion stop "${SLINGSHOT_VMX}"
export SLINGSHOT_OUT_DIR="/path/to/output"
ovftool --name=slingshot-ce -st=vmx -tt=ova "${SLINGSHOT_VMX}" "${SLINGSHOT_OUT_DIR}"/slingshot-$(date -u +%Y%m%d).ova
```

OVA is basically just a .tar of the OVF directory.
