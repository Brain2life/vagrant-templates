Vagrant.configure("2") do |config|

  # VM machine configuration
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
  end

  # Ansible control node
  config.vm.define "ansible-control" do |control|
    control.vm.box = "centos/7"
    control.vm.hostname = "control"
    control.vm.provision "shell" do |s|
      s.path = "./provision/control_node.sh"
    end
    control.vm.network :private_network, ip: "192.168.56.11"
  end

  # Ansible worker node 1
  config.vm.define "ansible-worker1" do |worker1|
    worker1.vm.box = "centos/7"
    worker1.vm.hostname = "worker1"
    worker1.vm.network :private_network, ip: "192.168.56.12"
  end

  # Ansible worker node 2
  config.vm.define "ansible-worker2" do |worker2|
    worker2.vm.box = "centos/7"
    worker2.vm.hostname = "worker2"
    worker2.vm.network :private_network, ip: "192.168.56.13"
  end 

end