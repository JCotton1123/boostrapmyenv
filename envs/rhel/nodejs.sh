#!/bin/bash

# Repos
yum -y install epel-release

# NodeJS and essentials + Express
yum install -y nodejs npm
npm install -g bower
npm install -g express
