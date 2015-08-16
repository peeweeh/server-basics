#!/bin/sh
source /var/server-basics/ibm/softlayer/get_server_info.sh
source /root/swift_profile
echo "********* Log Setup ********"

if [ -z "$1" ]; then
	echo "********* Container Prefix Not Found ********"
	exit 1
else

	echo "********* Downloading Configs ********"

	crontab -l > /tmp/cron

	rm -rf /opt/log_sync.sh
	cp  /var/server-basics/ibm/logs/sync_logs.sh /opt/log_sync.sh
	chmod +x /opt/log_sync.sh

	echo "0 * * * *   /opt/log_sync.sh $1" >>  /tmp/cron
	crontab /tmp/cron
	rm -rf /tmp/cron
fi