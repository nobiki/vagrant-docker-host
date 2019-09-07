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
if [ ! -e /usr/local/bin/docker-compose ]; then
    wget https://github.com/docker/compose/releases/download/${COMPOSE_VER}/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    gpasswd -a vagrant docker
fi

# ctop
if [ ! -e /usr/local/bin/ctop ]; then
    wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop
    chmod +x /usr/local/bin/ctop
fi

# dotfiles
tee /home/vagrant/.gitconfig << EOF
[core]
    filemode = false
    editor = vim
[http]
    sslVerify = false
    postBuffer = 524288000
[alias]
    pl  = pull
    pul = pull
    ps  = push
    pus = push
    co  = checkout
    cp  = cherry-pick
    br  = branch
    tg  = tag
    st  = stash
    sta = stash
EOF
chown vagrant. /home/vagrant/.gitconfig

tee /home/vagrant/.bash_profile << EOF
# some more aliases
alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'
alias llha='ls -lha'
alias la='ls -A'
alias l='ls -CF'
alias h='history'
alias c='clear'
alias t='toilet'
alias s='screen'
alias q='exit'

export HISTTIMEFORMAT='[%F %T] '
export EDITOR='/usr/bin/vim'

export DISPLAY=localhost:0.0
EOF
chown vagrant. /home/vagrant/.bash_profile

echo "[docker] "`/usr/bin/docker -v`
echo "[docker-compose] "`/usr/local/bin/docker-compose -v`
