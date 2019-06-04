# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # Mapping ports
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # shared folder (mapped)
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.synced_folder "opt", "/opt"
  config.vm.synced_folder "www", "/var/www"

  # automating configuration SHELL way
  # config.vm.provision "shell", path: "scripts/lamp.sh", privileged: false

  # automating with Chef
  # config.vm.provision "chef_solo", run_list: ["lamp"]

  # app layer
  config.vm.define "app" do |app|
    app.vm.provision "chef_solo", run_list: ["app"]
    app.vm.network "private_network", ip: "172.28.128.10"
  end

  # db layer
  config.vm.define "db" do |db|
    db.vm.provision "chef_solo", run_list: ["db"]
    db.vm.network "private_network", ip: "172.28.128.100"
  end

end
