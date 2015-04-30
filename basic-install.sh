#!/bin/sh
sudo yum-config-manager --enable epel
ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime
yum update --exclude=kernel* -y | tee -a /var/log/messages
yum install -y gcc-c++ pcre-dev pcre-devel zlib-devel make jq npm awslogs
yum install -y mysql nginx memcached 
yum install -y php55 php55-fpm php55-mysql php55-gd php55-xml php55-odbc php55-imap php55-mcrypt php55-soap php55-mbstring php55-pecl-memcache php55-mysqlnd php55-pdo
yum install -y php-pear  
yum install -y python-pip aws-cli nc telnet htop svn perl-libwww-perl pinentry rng-tools
pip install ngxtop