#!/bin/sh
echo "********* Change Hostname to Auto Scaling Group ********"
source /var/server-basics/get_aws_info.sh
if [[ ! -z "$ASG" ]]; then
	echo "Changing Hostname to $ASG"
	hostname $ASG
	service network restart
fi


