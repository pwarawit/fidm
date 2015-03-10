#!/usr/bin/env bash

# This script install phpPgAdmin and configure it 
yum -y insetall epel-release
yum -y update all
yum -y install phpPgAdmin httpd

# Configure Apache - the file /etc/httpd/conf.d/phpPgAdmin
cp /etc/httpd/conf.d/phpPgAdmin.conf /etc/httpd/conf.d/phpPgAdmin.conf.oirig
sed -i "s/Require local/Require all granted/g" /etc/httpd/conf.d/phpPgAdmin.conf
sed -i "s/Deny from all/Allow from all/g" /etc/httpd/conf.d/phpPgAdmin.conf


