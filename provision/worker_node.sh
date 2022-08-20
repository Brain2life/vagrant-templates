#!/usr/bin/env bash

###################################
# Ansible worker node configuration
###################################
# echo "Generating SSH keys ..."
# ssh-keygen -b 4096 -t rsa -f /home/vagrant/.ssh/$(hostname)_sshkey -q -N ""
echo "Enabling SSH password authentication ..."
sudo sed -re 's/^(PasswordAuthentication)([[:space:]]+)no/\1\2yes/' -i.`date -I` /etc/ssh/sshd_config
sudo service sshd restart