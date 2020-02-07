# Demo Vagrantfile used to provision Nym Mixnode

This repo contains a simple demo Vagrantfile and scripts that provision a Nym mixnode. The vagrant will install the stable release of the nym mixnode.

Make sure `vagrant` is installed on the host. To install `vagrant`, read the documentation https://www.vagrantup.com/docs/installation/

## Running the Mixnode

`vagrant up`

Then connect to the vagrant `vagrant ssh` and run the mixnode with the following command `./script/run.sh`

To check if your mixnode is properly announced, look for your public IP or your mixnode public key at https://dashboard.nymtech.net/

If Rust install fails, you can run the vagrant again forcing the installing scripts to run again with the command `vagrant up --provision`

## Networking

Nym mixnode requires port 1789 to be reachable. The Vagrantfile is exposing port 1789 within the host machine. Please make sure the host machine port 1789 is reachable with the host public IP address.

The Vagrant is set to use the public network. If more than one network interface is available on the host machine, Vagrant will ask you to choose which interface the virtual machine should bridge to. 

At the question `Which interface should the network bridge to?` answer with the appropriate number (1 to x).

If you are using VirtualBox as the default vagrant provider, you can check the list of interfaces with the following command `VBoxManage list bridgedifs`. 

## Updating

You can update Nym mixnode to the latest stable version by running `vagrant up --provision-with update`

You can replace `up` with `reload` if your vagrant is already `up`.

## Unstable version

You can install the latest unstable version from Nym `develop` branch by running  `vagrant up --provision-with unstable`

You can replace `up` with `reload` if your vagrant is already `up`.

## Vagrant

You can stop your vagrant with `vagrant halt`. You can destroy your vagrant with `vagrant destroy`. See more vagrant commands at https://www.vagrantup.com/docs/cli/

## About NYM

- https://nymtech.net/
- https://github.com/nymtech/nym
- https://nymtech.net/docs/mixnet/installation/
