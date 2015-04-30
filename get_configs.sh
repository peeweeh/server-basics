#!/bin/sh
source /var/server-basics/get_aws_info.sh
aws s3 cp s3://$VPC/config/server/download_devops.sh /var/download_devops.sh