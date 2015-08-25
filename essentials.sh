#!/bin/bash

OS=""

if [ -f /etc/centos-release ] && [ -f /etc/redhat-release ]; then
    OS="RHEL"
fi

if [ -z $OS ]; then
    echo "Unrecognized operating system"
    exit 1
fi

# Install packages
if [ $OS == "RHEL" ]; then
    sudo yum install -y git vim wget curl
    sudo yum install -y bash-completion
    sudo yum install -y telnet mailx 
fi

# Key setup
mkdir -p ~/.ssh
chmod 0700 ~/.ssh
curl https://github.com/jcotton1123.keys >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# Bash profile
cat <<EOD >> ~/.bashrc
export EDITOR=vim
alias vi="vim" # Bad but w/e
EOD

# Setup Vim
curl http://jcotton1123.github.io/boostrapmyenv/configs/vimrc > ~/.vimrc

# Git configuration
git config --global user.name "Jesse Cotton"
git config --global user.email "jcotton1123@gmail.com"
cat <<EOD >> ~/.gitignore_global
.DS_Store
.vagrant
EOD
