# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "ubuntu", primary: true do |ubuntu|
  	  ubuntu.vm.box = "ubuntu/xenial64"
  	  ubuntu.vm.provision :shell, path: "vagrant/provision.sh"
  	  ubuntu.vm.hostname = "rocketpanel"
  	  ubuntu.vm.network "private_network", ip: "192.168.36.12"
  	  ubuntu.hostsupdater.aliases = ["rocketpanel.local"]
    end

end
