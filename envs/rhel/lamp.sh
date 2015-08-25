#!/bin/bash

# Repos
yum -y install epel-release
rpm -i https://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-14.ius.centos6.noarch.rpm

# Essential upgrades
yum update -y ca-certificates

# Install php, apache, mysql
yum install -y php55u php55u-mysql php55u-pdo php55u-intl php55u-mbstring
yum install -y httpd mod_php mod_ssl
yum install -y mysql-server

# Start/enable services
chkconfig --level 2345 httpd on
/sbin/service httpd start
chkconfig --level 2345 mysqld on
/sbin/service mysqld start

# PHP development
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin


