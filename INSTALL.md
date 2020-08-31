# Prerequisites

This is an overview of the steps to get up and running, with details below:

1. Install VMWare Workstation / Fusion Pro
2. Install Vagrant
3. Install Vagrant VMWare Utility
4. Add Vagrant VMWare Utility license
5. Install Git
6. Install Git-LFS
7. Check out code

## VMWare Workstation / Fusion Pro

You must purchase and install VMWare Workstation (<https://www.vmware.com/products/workstation-pro.html>) or VMWare Fusion Pro (<https://www.vmware.com/products/fusion.html>).

**THIS WILL NOT WORK WITH THE NON-PRO VERSION OF VMWARE FUSION!**

## Vagrant

You must install Vagrant. The quickest way is through a package manager:

* MacOS: `brew cask install vagrant`
* Linux: `apt-get install vagrant`
* Windows: `choco install vagrant`

For manual installation, see: <https://www.vagrantup.com/downloads.html>

### Vagrant VMWare Utility

In addition, you must purchase and install the Vagrant VMWare Utility from <https://www.vagrantup.com/vmware/downloads.html>.

Download your license file to a known location. These instructions reference `~/Downloads/license.lic`, but replace this with the path to your license file. Then run:

```bash
vagrant plugin install vagrant-vmware-desktop --plugin-version 2.0.2
vagrant plugin license vagrant-vmware-desktop ~/Downloads/license.lic
```

## Git

You must install Git. The quickest way is through a package manager:

* MacOS: `brew install git`
* Linux: `apt-get install git`
* Windows: `choco install git`

For manual installation, see: <https://git-scm.com/downloads>

## Git LFS

You must install Git LFS. The quickest way is through a package manager:

* MacOS: `brew install git-lfs`
* Linux: `apt-get install git-lfs`
* Windows: `choco install git-lfs`

For manual installation, see: <https://help.github.com/en/articles/installing-git-large-file-storage>

Then run:

```bash
git lfs install
```

## Vagrant Up

### Check out the latest code

```bash
git clone https://github.com/sansinstitute/slingshot.git
```

### Create Slingshot machine

```bash
vagrant up slingshot
```
