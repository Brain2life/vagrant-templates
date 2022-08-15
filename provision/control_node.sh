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