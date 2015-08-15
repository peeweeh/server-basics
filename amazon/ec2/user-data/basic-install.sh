#!/bin/bash 
yum install -y git awscli 
git clone https://github.com/peeweeh/server-basics.git /var/server-basics 
sh /var/server-basics/basic-install.sh 
sh /var/server-basics/get_configs.sh 
sh /var/download_devops.sh 
sh /var/development-operations/server/install_users.sh 
sh /var/development-operations/server/setup_logs.sh 
sh /var/development-operations/server/set_bash.sh 
sh /var/development-operations/server/auto_on.sh 