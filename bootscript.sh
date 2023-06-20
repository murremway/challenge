#!/bin/bash

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Install Java JDK 8
echo "Installing Java JDK 8..."
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk


#docker pull down the image hello world
sudo su
docker pull murremway/challenge:latest
docker run -d -p 8080:80 murremway/challenge:latest

