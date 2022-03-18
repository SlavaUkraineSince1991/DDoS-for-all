#!/bin/bash

##### Script for installing Docker for Ubuntu
##### To run it just paste the following command to your Terminal:
# >>>>> curl -s https://raw.githubusercontent.com/SlavaUkraineSince1991/DDoS-for-all/main/scripts/docker_install.sh | bash <<<<<
##### Then check if Docker was installed by running the following command
# >>>>> sudo docker --version <<<<<
##### If output is smth like this: `Docker version 20.10.13, build a224086`, then everything is OK

sudo apt-get update
sudo apt-get install ca-certificates gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "Installation completed!"
