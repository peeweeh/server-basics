#!/bin/sh
echo "========== Crontab Logs"
crontab -l > /tmp/cron

rm -rf /opt/log_to_s3.sh
cp  /var/server-basics/amazon/ec2/log_to_s3.sh /opt/log_to_s3.sh
chmod +x /opt/log_to_s3.sh

echo "*/5 * * * *  /opt/log_to_s3.sh" >>  /tmp/cron

crontab /tmp/cron
rm -rf /tmp/cron