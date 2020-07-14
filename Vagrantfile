# -*- mode: ruby -*-
# vi: set ft=ruby :

time = Time.new

Vagrant.configure("2") do |config|
	config.vagrant.plugins = "vagrant-reload"

    config.vm.define "slingshot" do |machine|
        `(tar -C labs/slingshot -czf slingshot.tar.gz .)`

        commit = `git log --format="%H" -n 1`
        version = "#{time.year}.#{time.month}.#{commit[0..6]}"

        machine.vm.box = "bento/ubuntu-18.04"
        machine.vm.hostname = "slingshot"

        machine.vm.provider "vmware_fusion" do |v|
            v.gui = true

            v.vmx['displayname'] = "slingshot"
            v.vmx["memsize"] = "2048"
            v.vmx["numvcpus"] = "2"

            v.vmx["sound.present"] = "TRUE"
            v.vmx["sound.autoDetect"] = "TRUE"
            v.vmx["sound.startConnected"] = "TRUE"
            v.vmx["sound.fileName"] = "-1"

            v.vmx["ehci.present"] = "TRUE"
            v.vmx["ehci.pcislotnumber"] = "37"
            v.vmx["usb.present"] = "TRUE"
            v.vmx["usb:0.present"] = "TRUE"
            v.vmx["usb:0.deviceType"] = "hid"
            v.vmx["usb:0.port"] = "0"
            v.vmx["usb:0.parent"] = "-1"
            v.vmx["usb:1.present"] = "TRUE"
            v.vmx["usb:1.deviceType"] = "hub"
            v.vmx["usb:1.port"] = "1"
            v.vmx["usb:1.parent"] = "-1"
            v.vmx["usb:1.speed"] = "2"
        end

        machine.vm.provision "shell",
            inline: "sed -i 's/^DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION=\"'Slingshot')} #{version}\"/' /etc/lsb-release"

        machine.vm.provision :file, source: "slingshot.tar.gz", destination: "/tmp/labs.tar.gz"

        machine.vm.provision "setup", type: "ansible_local" do |ansible|
            ansible.playbook = "ansible/slingshot.yml"
        end

        machine.vm.provision :reload
    end
end