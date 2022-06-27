Vagrant.configure("2") do |config|
  
  # Jenkins master node
  config.vm.define "master" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = "master"
    master.vbguest.installer_options = { allow_kernel_upgrade: true }
    master.vm.provision "shell" do |s|
      s.path = "./provision/master_node.sh"
    end
    master.vm.network :private_network, ip: "192.168.56.10"
    master.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
  end  

  # Jenkins worker node 1
  config.vm.define "worker1" do |worker1|
    worker1.vm.box = "ubuntu/bionic64"
    worker1.vm.hostname = "worker1"
    worker1.vm.network :private_network, ip: "192.168.56.11"
    worker1.vm.provision "shell" do |s|
      s.path = "./provision/worker_node.sh"
    end
  end

  # Jenkins worker node 2
  config.vm.define "worker2" do |worker2|
    worker2.vm.box = "ubuntu/bionic64"
    worker2.vm.hostname = "worker2"
    worker2.vm.network :private_network, ip: "192.168.56.12"
    worker2.vm.provision "shell" do |s|
      s.path = "./provision/worker_node.sh"
    end
  end

end