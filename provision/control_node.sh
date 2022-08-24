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
touch /home/vagrant/ansible/ansible.cfg
cat <<EOF > /home/vagrant/ansible/ansible.cfg
[defaults]
host_key_checking = false;
inventory = ./hosts.txt  ;
EOF
touch /home/vagrant/ansible/playbook_test_connection.yml
cat <<EOF > /home/vagrant/ansible/playbook_test_connection.yml
---
- name: Test connection to servers
  hosts: all
  become: yes
  
  tasks:

  - name: Ping servers
    ping:
EOF
touch /home/vagrant/ansible/playbook_install_apache.yml
cat <<EOF > /home/vagrant/ansible/playbook_install_apache.yml
---
- name: Install default Apache Web Server
  hosts: all
  become: yes

  tasks:
  - name: Install Apache Web Server
    yum: name=httpd state=latest
    
  - name: Start Apache and enable on the boot
    service: name=httpd state=started enabled=yes 
EOF
cd /home/vagrant/ansible
mkdir app
sudo chown vagrant app/
touch app/index.html
cat <<EOF > /home/vagrant/ansible/app/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    Hello, World! This is my website! Created by Maxat Akbanov
</body>
</html>
EOF


echo "Disabling host_key_checking ..."
sudo sed -i '/host_key_checking = False/s/^#//g' /etc/ansible/ansible.cfg
