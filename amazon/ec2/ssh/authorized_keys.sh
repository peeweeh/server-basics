#!/bin/bash -e
rm -rf /opt/authorized_keys_command.sh
cp  /var/server-basics/amazon/ec2/ssh/authorized_keys_command.sh /opt/authorized_keys_command.sh
chmod +x /opt/authorized_keys_command.sh
sed -i 's:#AuthorizedKeysCommand none:AuthorizedKeysCommand /opt/authorized_keys_command.sh:g' /etc/ssh/sshd_config
sed -i 's:#AuthorizedKeysCommandUser nobody:AuthorizedKeysCommandUser nobody:g' /etc/ssh/sshd_config