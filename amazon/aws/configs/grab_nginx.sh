#!/bin/bash
echo "********* Get Configuration from S3 Bucket ********"
source /var/server-basics/get_aws_info.sh
folder="hostname"
bucket_folder="hostname-$HOSTNAME"
if [[ ! -z "$1" ]]; then
	echo "Folder Entered"
	folder=$1
fi
if [ $folder == "subnet" ]; then
	echo "Subnet Selected"
	bucket_folder="$SUBNET"
fi
full_source=s3://$VPC/config/$bucket_folder
echo $full_source

aws s3 sync $full_source/nginx/ /etc/nginx/ --delete --exact-timestamps
aws s3 sync $full_source/php-fpm/ /etc/php-fpm.d/ --delete --exact-timestamps
aws s3 sync $full_source/awslogs/ /etc/awslogs/ --exact-timestamps
aws s3 sync $full_source/logrotate/ /etc/logrotate.d/ --exact-timestamps

service php-fpm restart
service nginx restart
service awslogs restart
free && sync && echo 3 > /proc/sys/vm/drop_caches && free