#!/bin/sh
echo "********* Install Users from S3 ********"
source /var/server-basics/amazon/aws/get_server_info.sh

mkdir -p /tmp/sudoers
aws s3 sync s3://$VPC/config/sudoers /tmp/sudoers

for file in /tmp/sudoers/*
do  bname=$(basename $file) &&  sh /var/server-basics/amazon/ec2/add_user.sh $bname s3://$VPC/config/sudoers
done
