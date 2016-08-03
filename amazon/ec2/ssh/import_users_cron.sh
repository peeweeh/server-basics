#!/bin/bash -e
echo "========== Crontab Users"
crontab -l > /tmp/cron

rm -rf /opt/import_users.sh
cp  /var/server-basics/amazon/ec2/ssh/import_users.sh /opt/import_users.sh
chmod +x /opt/import_users.sh

echo "*/10 * * * * root /opt/import_users.sh" >>  /tmp/cron

crontab /tmp/cron
rm -rf /tmp/cron