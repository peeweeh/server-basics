#!/bin/sh
source /var/server-basics/ibm/softlayer/get_server_info.sh
source /root/swift_profile

if [ -z "$1" ]; then
	echo "********* Container Prefix Not Found ********"
	exit 1
else
	cd /var/log
	swift upload $1-log/$YEAR/$MONTH/$DAY/$HOSTNAME-$IP/ .
fi