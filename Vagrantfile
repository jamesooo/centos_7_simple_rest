# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # because sqlite requires permissions on the db directory we set owner to our app user
  # who will be created by puppet
  config.vm.synced_folder "database/", "/var/lib/sqlite3",
    owner: 700, group: 700
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.vm.provision "shell" , path: "puppet-strap.sh"
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end
end
