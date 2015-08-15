#!/bin/sh
echo "********* Install PHP 5.6 on Softlayer ********"
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm | tee -a /var/log/install-scripts.log
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm | tee -a /var/log/install-scripts.log
yum install -y git | tee -a /var/log/install-scripts.log
git clone https://github.com/peeweeh/server-basics.git /var/server-basics | tee -a /var/log/install-scripts.log
#sh /var/server-basics/general/networking/iptables-rules.sh
sh /var/server-basics/general/bash/set_default_bash.sh
ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime
#yum -y -x 'kernel*' update | tee -a /var/log/install-scripts.log

yum install -y python-devel libffi-devel git gcc-c++ pcre-dev pcre-devel zlib-devel make jq npm awslogs | tee -a /var/log/install-scripts.log
yum install -y mysql nginx memcached  | tee -a /var/log/install-scripts.log
yum install -y php56w php56w-fpm php56w-mysql php56w-gd php56w-xml php56w-odbc php56w-imap php56w-mcrypt php56w-soap php56w-mbstring php56w-pecl-memcache php56w-pecl-memcached php56w-pdo | tee -a /var/log/install-scripts.log
yum install -y php-pear  | tee -a /var/log/install-scripts.log
yum install -y nc telnet htop svn perl-libwww-perl pinentry rng-tools python-pip | tee -a /var/log/install-scripts.log
pip install pyopenssl ndg-httpsclient pyasn1 python-swiftclient python-novaclient
chkconfig nginx on
chkconfig httpd on

echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
