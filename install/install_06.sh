#!/usr/bin/env bash

# This script will create 3 database required by Pentaho under PostgreSQL
su - postgres -c "psql -a -f /opt/pentaho/biserver-ce/data/postgresql/create_quartz_postgresql.sql"
su - postgres -c "psql -a -f /opt/pentaho/biserver-ce/data/postgresql/create_repository_postgresql.sql"
su - postgres -c "psql -a -f /opt/pentaho/biserver-ce/data/postgresql/create_jcr_postgresql.sql"
su - postgres -c "psql -a -f /opt/fidm/install/create_QRTZ.sql"

