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
    yum install -y git vim wget
fi

# Key setup
mkdir -p ~/.ssh
chmod 0700 ~/.ssh
wget -O ~/.ssh/authorized_keys --no-check-certificate https://github.com/jcotton1123.keys
chmod 0600 ~/.ssh/authorized_keys

# Setup Vim
wget -O ~/.vimrc --no-check-certificate jcotton1123.github.io/bootstrapmeenv/configs/vimrc

# Git configuration
git config --global user.name "Jesse Cotton"
git config --global user.email "jcotton1123@gmail.com"

