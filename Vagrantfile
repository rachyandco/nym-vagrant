# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 1789, host: 1789
  config.vm.network "public_network"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Nym Mixnode"
    vb.customize ["modifyvm", :id, "--memory", "2046"]
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    #vb.memory = "2048"
  end

  config.vm.synced_folder ".", "/home/vagrant/script"

  config.vm.provision "system", type: "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y pkg-config build-essential libssl-dev
     echo 'curl https://sh.rustup.rs -sSf | sh -s -- -y;' | su vagrant
  SHELL

  config.vm.provision "nym", type: "shell", inline: <<-SHELL, privileged: false
     git clone https://github.com/nymtech/nym.git
     cd nym
     git checkout master
     cargo build --release
  SHELL

  config.vm.provision "update", type: "shell", run: "never", inline: <<-SHELL, privileged: false
     cd nym
     git fetch origin
     git reset --hard origin/master
     cargo build --release
  SHELL

  config.vm.provision "unstable", type: "shell", run: "never", inline: <<-SHELL, privileged: false
     cd nym
     git fetch origin
     git reset --hard origin/develop
     cargo build --release
  SHELL
end
