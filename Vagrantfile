# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Configuring the box to use Ubuntu 20.04 (Focal Fossa)
  config.vm.box = "ubuntu/focal64"

  # Virtual machine configuration
  config.vm.define "ubuntu_vm" do |ubuntu|
    ubuntu.vm.hostname = "ubuntu-vm"
    
    # Provider-specific configuration (VirtualBox in this case)
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.name = "Ubuntu20.04VM"
      vb.memory = "1024"
      vb.cpus = 2
    end

  end
end