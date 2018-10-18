#!/bin/bash -e
echo "***** Server Basics Initial Script *****"
echo "*** Update AWS CLI, Install dependencies and update"
yum install -y aws-cli jq
yum update -y
echo "*** Setup Bash"
sh /var/server-basics/general/bash/set_default_bash.sh

echo "*** Setup SSH for IAM"
sh /var/server-basics/amazon/ec2/ssh/setup.sh

echo "*** Setup Logging to S3"
sh /var/server-basics/amazon/ec2/s3_logs/setup.sh

echo "*** Setup Hostname Automation"
sh /var/server-basics/amazon/ec2/hostname/setup.sh