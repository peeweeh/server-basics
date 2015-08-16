#!/bin/sh

source /root/swift_profile
cd /etc/nginx

if [-z "$1"]
	then
	echo "********* Container Prefix Not Found ********"
	exit 1
else
	echo "********* Downloading Configs ********"
	cd /etc/nginx
	swift download $1-nginx
	cd /etc/php-fpm.d
	swift download $1-php-fpm
	cd /etc/logrotate.d
	swift download $1-logrotate
	free && sync && echo 3 > /proc/sys/vm/drop_caches && free
	service nginx restart
	service php - fpm restart

fi
