#!/bin/sh
echo "********* Change Hostname to Auto Scaling Group ********"
source /var/server-basics/amazon/aws/get_server_info.sh
echo "Set Hostname from Auto Scaling Group"
if [[ ! -z "$ASG" ]]; then
	echo "Changing Hostname to $ASG"
	hostname $ASG
	service network restart
fi


