#!/usr/bin/env bash

###################################
# Jenkins master node configuration
###################################
echo "Installing Jenkins and Java ..."
sudo yum update -y
sudo yum install -y wget
sudo yum install -y java-1.8.0-openjdk-devel
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install -y jenkins
echo "Enable and start Jenkins ..."
sudo systemctl enable jenkins
sudo systemctl start jenkins