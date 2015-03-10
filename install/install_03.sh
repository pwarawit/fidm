#!/usr/bin/env bash

# This script install phpPgAdmin and configure it 
yum -y insetall epel-release
yum -y update all
yum -y install phpPgAdmin httpd

# Configure Apache - the file /etc/httpd/conf.d/phpPgAdmin
cp /etc/httpd/conf.d/phpPgAdmin.conf /etc/httpd/conf.d/phpPgAdmin.conf.oirig
sed -i "s/Require local/Require all granted/g" /etc/httpd/conf.d/phpPgAdmin.conf
sed -i "s/Deny from all/Allow from all/g" /etc/httpd/conf.d/phpPgAdmin.conf

# Restart Apache server
systemctl enable httpd
systemctl start httpd

# Configure phpPgAdmin
cp /etc/phpPgAdmin/config.inc.php /etc/phpPgAdmin/config.inc.php.orig
sed -i "s/$conf['servers'][0]['host'] = '';/$conf['servers'][0]['host'] = 'localhost';/g" /etc/phpPgAdmin/config.inc.php
sed -i "s/$conf['extra_login_security'] = true;/$conf['extra_login_security'] = false;/g" /etc/phpPgAdmin/config.inc.php
sed -i "s/$conf['owned_only'] = false;/$conf['owned_only'] = true;/g" /etc/phpPgAdmin/config.inc.php

# Restart postgresql server & Apache
systemctl restart postgresql-9.4
systemctl restart httpd

# Allow httpd to connect database
setssebool -P httpd_can_network_connect_db 1

