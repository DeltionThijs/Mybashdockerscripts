#!/bin/bash

sudo apt install dirmngr jsvc gnupg apt-transport-https software-properties-common ca-certificates curl openjdk-8-jdk 

curl -fsSL https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

sudo add-apt-repository 'deb https://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main'


sudo apt update	
sudo apt install mongodb-org

sudo systemctl enable mongod --now
su -
sudo apt --fix-broken install
sudo update-alternatives --config java
# typ 2 voor jdk 8


sudo wget https://static.tp-link.com/2021/202102/20210209/Omada_SDN_Controller_v4.2.11_linux_x64.deb
sudo dpkg -i Omada_SDN_Controller_v4.2.11_linux_x64.deb




