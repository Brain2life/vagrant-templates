# Simple Jenkins server setup with remote build agents

## Table of content:
1. [Lab environment setup](#lab-environment-setup)
2. [Overview](#overview)
3. [Usage](#usage)
4. [VM machine resource configuration](#vm-machine-resource-configuration)
5. [Ansible configuration](#ansible-configuration)
6. [Reference](#reference)

## Lab environment setup:  
![](./img/jenkins-lab.png)

## Overview:
0. Tested on host machine: Ubuntu 20.04, Vagrant 2.3.0, VirtualBox 6.1.34r150636
1. Ansible control node: CentOS7, IP: `192.168.56.10`, hostname: `control`
2. Worker nodes: CentOS7, IP: `192.168.56.11-[12]`, hostname: `worker1-[2]` 
3. Configuration of the Nodes is done via bash scripts in `provision` folder
4. [CentOS7 box](https://app.vagrantup.com/centos/boxes/7)
5. All three nodes in private network `192.168.56.1/21` with access to the Internet via NAT

## Usage:
1. Deploy the environment:
```shell
vagrant up
```
To check the deployment of VMs use:
```shell
vagrant global-status --prune
```
2. To SSH into VM:
```shell
vagrant ssh [vm_name]
```
3. To gracefully stop VMs use:
```shell
vagrant halt
```
4. To delete environment:
```shell
vagrant destroy
```
For more info check the following article: [Quick startup with Vagrant](https://brain2life.hashnode.dev/quick-startup-with-vagrant)

## VM machine resource configuration:
1. VM configuration is done with `v.customize` option
2. VMs use 2GB and 2CPU
2. Links:
    - [How do I increase the RAM and set up host-only networking in Vagrant?](https://stackoverflow.com/questions/12308149/how-do-i-increase-the-ram-and-set-up-host-only-networking-in-vagrant)

## Ansible configuration:
To add worker nodes key fingerprints, on controller node run the following commands:
```shell
ssh 192.168.56.12
ssh 192.168.56.13
```

## Test connectivity to worker nodes:
To test connectivity from control node to your worker node, in `ansible` folder on control node run:
```shell
ansible -i hosts.txt all --ask-pass -m ping
```
Enter password `vagrant`. Should return `SUCCESS` message

## Reference:
1. [Vagrant boxes](https://app.vagrantup.com/boxes/search)
2. [Installing Ansible on Fedora or CentOS](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-fedora-or-centos)
3. [Multiple Vagrant VMs in One Vagrantfile](https://www.thisprogrammingthing.com/2015/multiple-vagrant-vms-in-one-vagrantfile/)
4. [Automatically Accept SSH Fingerprint](https://www.putorius.net/automatically-accept-ssh-fingerprint.html)
5. [How to ssh between a cluster of Vagrant guest VMs](https://superuser.com/questions/671191/how-to-ssh-between-a-cluster-of-vagrant-guest-vms)
6. [How to Use SSH Password-Based Login in Ansible Using sshpass](https://linuxhint.com/how_to_use_sshpass_to_login_for_ansible/)
7. [Ansible connection methods and details](https://docs.ansible.com/ansible/latest/user_guide/connection_details.html#host-key-checking)
8. [Is there a way to prevent sed from interpreting the replacement string?](https://unix.stackexchange.com/questions/255789/is-there-a-way-to-prevent-sed-from-interpreting-the-replacement-string)