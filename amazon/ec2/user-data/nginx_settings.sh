#!/bin/bash 
echo "********* Get Hostname User Data ********"
sh /var/server-basics/amazon/aws/system/set_hostname_from_instance_metadata.sh
sh /var/server-basics/amazon/aws/configs/grab_nginx.sh