#!/bin/sh
echo "********* Set Hostname to reflect instance name on boot ********"
source /var/server-basics/amazon/aws/get_server_info.sh
export NAME=$(aws ec2 describe-tags --filters "Name=resource-id,Values=$IID" --region=$EC2_REGION | jq -r '.Tags[] | ( if .Key == "Name" then  .Value else  "" end )' )

lockfile=/var/tmp/hostnamelock
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null; then
		echo "hostname $NAME" >> /etc/rc.local
		echo "Added Hostname Information"
else
    	echo "Lock Exists: $lockfile owned by $(cat $lockfile)"
fi