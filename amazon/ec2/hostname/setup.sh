#!/bin/sh
echo "***** Setup Hostname Install on Boot ******"
source /var/server-basics/get_aws_info.sh

lockfile=/var/tmp/hostnamelock
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null; then
		echo "sh /var/server-basics/amazon/ec2/hostname/set_hostname_from_instance_name.sh" >> /etc/rc.local
		echo "***** Running Script *****"
		sh /var/server-basics/amazon/ec2/hostname/set_hostname_from_instance_name.sh
else
    	echo "Lock Exists: $lockfile owned by $(cat $lockfile)"
fi