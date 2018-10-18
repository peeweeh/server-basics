#!/bin/sh
echo "********* Set Hostname to reflect Tag Name on boot ********"
source /var/server-basics/get_aws_info.sh
hostname $NAME