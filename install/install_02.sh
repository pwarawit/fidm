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

# Modifying pg_hba.conf
cp /var/lib/pgsql/9.4/data/pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf.orig
sed -i "/^host/s/ident/md5/g" /var/lib/pgsql/9.4/data/pg_hba.conf

# Modifying postgresql.conf -- allow tcp/ip connection
cp /var/lib/pgsql/9.4/data/postgresql.conf /var/lib/pgsql/9.4/data/postgresql.conf.orig
sed -i "s/max_connections = 100/listen_addresses = '*'\nport = 5432\nmax_connections = 100/g" /var/lib/pgsql/9.4/data/postgresql.conf

# Restart postgresql server
systemctl restart postgresql-9.4

