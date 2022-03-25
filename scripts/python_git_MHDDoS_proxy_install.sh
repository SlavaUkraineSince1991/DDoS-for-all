#!/bin/bash

##### Script for installing Python, Git and MHDDoS_proxy for Ubuntu
##### To run it just paste the following command to your Terminal:
# >>>>> curl -s https://raw.githubusercontent.com/SlavaUkraineSince1991/DDoS-for-all/main/scripts/python_git_MHDDoS_proxy_install.sh | bash <<<<<

# Install git, python3, pip if doesn't installed already
sudo sudo apt update -y
if [ ! -f /usr/bin/git ]; then
   sudo apt install git -y
fi
if [ ! -f /usr/bin/python3 ]; then
   sudo apt install python3 -y
fi
if [ ! -f /usr/bin/pip ]; then
   apt install python3-pip  -y
fi
if [ ! -f /usr/bin/wget ]; then
   apt install wget  -y
fi
if [ ! -f /usr/bin/curl ]; then
   apt install curl  -y
fi
pip install --upgrade pip > /dev/null #No output. Resolved some problems with pip on debian

#Install latest version of mhddos_proxy and MHDDoS
cd ~
rm -rf mhddos_proxy
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
cd mhddos_proxy
python3 -m pip install -r requirements.txt
