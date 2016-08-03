#!/bin/bash -e
echo "========== Add Authorized Keys"
rm -rf /opt/authorized_keys_command.sh
cp  /var/server-basics/amazon/ec2/ssh/authorized_keys_command.sh /opt/authorized_keys_command.sh
chmod +x /opt/authorized_keys_command.sh
sed -i 's:#AuthorizedKeysCommand none:AuthorizedKeysCommand /opt/authorized_keys_command.sh:g' /etc/ssh/sshd_config
sed -i 's:#AuthorizedKeysCommandUser nobody:AuthorizedKeysCommandUser nobody:g' /etc/ssh/sshd_config

echo "========== Add Importing of Users via Crontab"
crontab -l > /tmp/cron

rm -rf /opt/import_users.sh
cp  /var/server-basics/amazon/ec2/ssh/import_users.sh /opt/import_users.sh
chmod +x /opt/import_users.sh

echo "*/10 * * * * root /opt/import_users.sh" >>  /tmp/cron

crontab /tmp/cron
rm -rf /tmp/cron

echo "========== Run Initial Import"
/opt/import_users.sh

echo "========== Remove Ec2 User"
userdel ec2-user

echo "========== Restart SSH Service"
service sshd restart