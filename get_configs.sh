#!/bin/sh
source /var/server-basics/get_aws_info.sh
aws s3 cp s3://$VPC/config/server/install-detailed.sh /var/install-detailed.sh