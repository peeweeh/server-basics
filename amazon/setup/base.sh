#!/bin/sh
echo "********* Install Server Basics from Base ********"
lockfile=/var/tmp/base
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null; then
	yum install -y wget awscli jq git
	git clone https://github.com/peeweeh/server-basics.git /var/server-basics
	sh /var/server-basics/amazon/ec2/ssh/setup.sh
	sh /var/server-basics/amazon/ec2/ssm/setup.sh
	sh /var/server-basics/amazon/ec2/hostname/setup.sh
	sh /var/server-basics/general/bash/set_default_bash.sh
else
    	echo "Lock Exists: $lockfile owned by $(cat $lockfile)"
fi