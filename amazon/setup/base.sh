#!/bin/sh
sh /var/server-basics/amazon/ec2/ssh/setup.sh
sh /var/server-basics/amazon/ec2/install_ssm.sh
sh /var/server-basics/amazon/aws/system/set_hostname_from_instance_name.sh
sh /var/server-basics/general/bash/set_default_bash.sh