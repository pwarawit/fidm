#!/usr/bin/env bash
# create_fidm_database.sh

set -e
set -u

psql \
    -X \
    -f /opt/fidm/sql/create_fidm_database.sql \
    --echo-all
    --set AUTOCOMMIT=off \
    --set ON_ERROR_STOP=on

psql_exit_status = $?

if [ $psql_exit_status != 0 ]; then
    echo "psql failed while trying to run this sql script" 1>&2
    exit $psql_exit_status
fi

echo "sql script successful"
exit 0
