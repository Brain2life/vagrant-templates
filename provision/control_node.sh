#!/usr/bin/env bash

#######################################
# Ansible controller node configuration
#######################################
echo "Installing Ansible ..."
sudo yum install epel-release -y
sudo yum install ansible -y

echo "Installed Ansible version is: "
ansible --version

echo "Enabling SSH password authentication ..."
sudo sed -re 's/^(PasswordAuthentication)([[:space:]]+)no/\1\2yes/' -i.`date -I` /etc/ssh/sshd_config
sudo service sshd restart

echo "Installing vim editor ..."
sudo yum install vim-enhanced -y

echo "Configuring Ansible files ..."
cd /home/vagrant/
mkdir ansible
sudo chown vagrant ansible/
touch /home/vagrant/ansible/hosts.txt
cat <<EOF > /home/vagrant/ansible/hosts.txt
[staging_servers]
worker1 ansible_host=192.168.56.11 ansible_user=vagrant ansible_pass=vagrant
worker2 ansible_host=192.168.56.12 ansible_user=vagrant ansible_pass=vagrant
EOF

echo "Disabling host_key_checking ..."
sudo sed -i '/host_key_checking = False/s/^#//g' /etc/ansible/ansible.cfg
