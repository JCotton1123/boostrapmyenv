#!/bin/bash

set -o pipefail

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export CHEF_VERSION=12.15.19

# Update APT cache - pretty much always needed
DEBIAN_FRONTEND=noninteractive apt-get update -y

# Create directories
mkdir -p /etc/chef
mkdir -p /var/chef /var/chef/cookbooks /var/chef/data_bags

# Static configurations
cat <<'EOS' > /etc/chef/solo.rb
cookbook_path ['/var/chef/cookbooks']
data_bag_path '/var/chef/data_bags'
log_location STDOUT
EOS

# Install Chef
curl -L https://www.opscode.com/chef/install.sh | bash -s -- -v $CHEF_VERSION
