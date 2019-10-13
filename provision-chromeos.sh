#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export COMPOSE_VER=1.24.1

sudo apt update
sudo apt install -y vim \
  git \
  locales \
  tzdata \
  fonts-noto-cjk \
  ibus-mozc \
  sed \
  gawk \
  curl \
  wget \
  rsync \
  dumb-init

# langage & timezone
# locale-gen ja_JP.UTF-8
# localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
# update-locale LANG=ja_JP.UTF-8
# ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# docker-ce
sudo apt-get install -y apt-transport-https ca-certificates curl wget gnupg2 software-properties-common lsb-release
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y wget docker-ce

# docker-compose
if [ ! -e /usr/local/bin/docker-compose ]; then
    sudo wget https://github.com/docker/compose/releases/download/${COMPOSE_VER}/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo gpasswd -a oji4444 docker
fi

# ctop
if [ ! -e /usr/local/bin/ctop ]; then
    sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop
    sudo chmod +x /usr/local/bin/ctop
fi

# dotfiles
tee /home/oji4444/.gitconfig << 'EOF'
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

tee /home/oji4444/.bash_profile << 'EOF'
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

# docker
alias d='docker'
alias dc='docker-compose'

# ibus-daemon
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export NO_AT_BRIDGE=1

export HISTTIMEFORMAT='[%F %T] '
export EDITOR='/usr/bin/vim'

export DISPLAY=localhost:0.0

EOF

echo "[docker] "`/usr/bin/docker -v`
echo "[docker-compose] "`/usr/local/bin/docker-compose -v`
