#!/bin/sh
echo "********* Get Instance Metadata ********"
export IID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
export MAC=`curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/`
export VPC=`curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC/vpc-id`
export IPV4=`curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC/local-ipv4s`
export EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
export EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"
export YEAR=$(date +"%Y")
export DAY=$(date +"%d")
export MONTH=$(date +"%m")
export HOUR=$(date +"%H")
export SUBNET=$(GET http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC/subnet-id)
export NAME=$(aws ec2 describe-tags --filters "Name=resource-id,Values=$IID" --region=$EC2_REGION | jq -r '.Tags[] | ( if .Key == "Name" then  .Value else  "" end )' )


if [[ ! -z "$IID" ]]; then
	AUTO_SCALING_GROUP=$(aws ec2 describe-tags --filters "Name=resource-id,Values=$IID" --region=$EC2_REGION | jq -r '.Tags[] | ( if .Key == "aws:autoscaling:groupName" then  .Value else  "" end )' )
fi
if [[ ! -z "$AUTO_SCALING_GROUP" ]]; then
	ASG=$(echo $AUTO_SCALING_GROUP | xargs)
fi

