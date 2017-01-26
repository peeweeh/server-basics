#!/bin/bash
source /var/server-basics/get_aws_info.sh


echo "********* Set Default Bash Script ********"
lockfile=/var/tmp/installsshm
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null; then
		cd /tmp
		curl https://amazon-ssm-$EC2_REGION.s3.amazonaws.com/latest/linux_amd64/amazon-ssm-agent.rpm -o amazon-ssm-agent.rpm
		yum install -y amazon-ssm-agent.rpm
else
    	echo "Lock Exists: $lockfile owned by $(cat $lockfile)"
fi