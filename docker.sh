#!/bin/sh

#添加docker安装源
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

#执行安装命令
sudo apt-get install -y docker-ce=18.03.0~ce-0~ubuntu

#添加docker用户组
sudo groupadd docker

#将当前用户加入docekr用户组
sudo gpasswd -a $USER docker

#更新用户组
newgrp docker

