#!/bin/bash 
echo "********* Basic Setup User Data ********"

yum install -y git awscli 
git clone https://github.com/peeweeh/server-basics.git /var/server-basics 
sh /var/server-basics/amazon/ec2/php5_5.sh
sh /var/server-basics/amazon/ec2/install_users.sh
sh /var/server-basics/amazon/ec2/setup_logs.sh
sh /var/server-basics/amazon/ec2/set_bash.sh
sh /var/server-basics/amazon/aws/system/set_hostname_from_instance_metadata.sh
sh /var/server-basics/amazon/aws/configs/grab_nginx.sh