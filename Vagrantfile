# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  # config.vm.box_check_update = false
  # Mapping ports
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # shared folder (mapped)
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.synced_folder "opt", "/opt"
  config.vm.synced_folder "www", "/var/www"
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #   vb.memory = "1024"
  # end
  # automating configuration SHELL way
  # config.vm.provision "shell", path: "scripts/lamp.sh", privileged: false
  # automating with Chef
  config.vm.provision "chef_solo", run_list: ["lamp"]
end
