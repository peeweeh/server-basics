#!/bin/bash
source /var/server-basics/get_aws_info.sh
aws s3 sync /var/log/ s3://$VPC/log/$YEAR/$MONTH/$HOSTNAME-$IID/ --region=$EC2_REGION --exact-timestamps