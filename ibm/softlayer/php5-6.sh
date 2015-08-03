#!/bin/sh
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime
yum update -y | tee -a /var/log/install-scripts.log

yum install -y gcc-c++ pcre-dev pcre-devel zlib-devel make jq npm awslogs | tee -a /var/log/install-scripts.log
yum install -y mysql nginx memcached  | tee -a /var/log/install-scripts.log
yum install -y php56w php56w-fpm php56w-mysql php56w-gd php56w-xml php56w-odbc php56w-imap php56w-mcrypt php56w-soap php56w-mbstring php56w-pecl-memcache php56w-mysqlnd php56w-pdo
yum install -y php-pear  | tee -a /var/log/install-scripts.log
yum install -y nc telnet htop svn perl-libwww-perl pinentry rng-tools| tee -a /var/log/install-scripts.log

chkconfig nginx on
chkconfig httpd on

echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
