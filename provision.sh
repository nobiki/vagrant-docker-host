#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export COMPOSE_VER=1.24.1

apt update
apt install -y vim \
  git \
  locales \
  tzdata \
  fonts-noto-cjk \
  ibus-mozc \
  sed \
  gawk \
  curl \
  wget \
  dumb-init

# langage & timezone
# locale-gen ja_JP.UTF-8
# localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
# update-locale LANG=ja_JP.UTF-8
# ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# docker-ce
apt-get install -y apt-transport-https ca-certificates curl wget gnupg2 software-properties-common lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install -y wget docker-ce

# docker-compose
wget https://github.com/docker/compose/releases/download/${COMPOSE_VER}/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
gpasswd -a vagrant docker

