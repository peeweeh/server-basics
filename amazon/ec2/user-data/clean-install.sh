#!/bin/bash 
echo "********* Basic Setup User Data ********"
yum install -y git
git clone https://github.com/peeweeh/server-basics.git /var/server-basics 
sh /var/server-basics/amazon/ec2/master/setup.sh