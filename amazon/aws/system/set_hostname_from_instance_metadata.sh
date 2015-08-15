#!/bin/sh
echo "********* Change Hostname to Instance Name Tag ********"
source /var/server-basics/amazon/aws/get_server_info.sh
AUTO_SCALING_GROUP=$(aws ec2 describe-tags --filters "Name=resource-id,Values=$IID" --region=$EC2_REGION | jq -r '.Tags[] | ( if .Key == "Name" then  .Value else  "" end )' )
ASG=$(echo $AUTO_SCALING_GROUP | xargs)

if [[ ! -z "$ASG" ]]; then
	echo "Changing Hostname to $ASG"
	hostname $ASG
	service network restart
fi
