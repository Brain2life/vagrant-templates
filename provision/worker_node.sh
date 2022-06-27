#!/usr/bin/env bash

####################################
# Jenkins worker node configuration
####################################
echo "Configuring Jenkins ..."
sudo apt update -y
mkdir ~/jenkins
echo "Installing Java ..."
sudo apt install -y openjdk-8-jre-headless
echo "Enabling SSH password authentication ..."
sudo sed -re 's/^(PasswordAuthentication)([[:space:]]+)no/\1\2yes/' -i.`date -I` /etc/ssh/sshd_config
sudo service sshd restart