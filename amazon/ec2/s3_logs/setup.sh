#!/bin/sh
echo "**** Setup Logs Saving to S3"
lockfile=/var/tmp/s3lock
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null; then

		trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT
		crontab -l > /tmp/cron

		rm -rf /opt/log_to_s3.sh
		cp  /var/server-basics/amazon/ec2/s3_logs/log_to_s3.sh /opt/log_to_s3.sh
		chmod +x /opt/log_to_s3.sh

		echo "*/5 * * * *  /opt/log_to_s3.sh" >>  /tmp/cron

		crontab /tmp/cron
		rm -rf /tmp/cron

else
    	echo "Lock Exists: $lockfile owned by $(cat $lockfile)"
fi