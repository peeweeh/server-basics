#!/bin/bash -e
sed -i 's:#AuthorizedKeysCommand none:AuthorizedKeysCommand /var/cf-basics/authorized_keys_command.sh:g' /etc/ssh/sshd_config
sed -i 's:#AuthorizedKeysCommandUser nobody:AuthorizedKeysCommandUser nobody:g' /etc/ssh/sshd_config