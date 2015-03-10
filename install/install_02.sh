#!/usr/bin/env bash

# This script install PostgreSQL9.4 and configure it
rpm -Uvh http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm
yum -y update all
yum -y install postgresql94-server postgresql94-contrib
/usr/pgsql-9.4/bin/postgresql94-setup initdb
systemctl enable postgresql-9.4
systemctl start postgresql-9.4
firewall-cmd --permanent --add-port=5432/tcp
firewall-cmd --reload


