#!/bin/bash

sudo yum update -y
sudo yum search docker 
sudo yum info docker

sudo yum install docker -y
sudo usermod -a -G docker ec2-user

wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service

export PATH=$PATH:/usr/local/bin

docker version

docker-compose version
