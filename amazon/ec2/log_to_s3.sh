#!/bin/bash
source /var/development-operations/general/shell/get_server_info.sh
aws s3 sync /var/log/ s3://$VPC/log/$YEAR/$MONTH/$HOSTNAME-$IID/ --region=$EC2_REGION --exact-timestamps