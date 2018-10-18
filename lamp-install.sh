#!/bin/sh
sudo yum-config-manager --enable epel
ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime
yum update -y | tee -a /var/log/messages
yum install -y gcc-c++ pcre-dev pcre-devel zlib-devel make jq npm awslogs
yum install -y httpd24 memcached 
yum install -y php56 php56-fpm php56-mysql php56-gd php56-xml php56-odbc php56-imap php56-mcrypt php56-soap php56-mbstring php56-pecl-memcache php56-mysqlnd php56-pdo
yum install -y php-pear  
yum install -y python-pip aws-cli nc telnet htop svn perl-libwww-perl pinentry rng-tools
pip install ngxtop
service httpd start
chkconfig httpd on
chkconfig awslogs on 
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php