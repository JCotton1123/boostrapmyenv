#!/bin/bash

# Repos
yum install -y epel-release

# Essential packages
yum install -y curl

# RVM setup
curl -L get.rvm.io | bash -s stable
usermod -G rvm vagrant
source /etc/profile.d/rvm.sh
rvm requirements
rvm install 2.0.0
rvm use 2.0.0 --default
rvm rubygems current

# Rails setup
gem install rails
echo "To begin: rails create myapp; cd myapp; rails server"
