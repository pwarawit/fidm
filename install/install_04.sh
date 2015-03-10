#!/usr/bin/env bash

# This function will use 
function cr_fidm {
    # $1 - name of the user (default fidm, but could be other)
    # $2 - password
    if id -u "$1" > /dev/null 2>&1; then
        echo "User $1 already exists"
    else
        adduser $1
        echo "localhost:*:*:$1:$2" > /home/$1/.pgpass
        chown $1:$1 /home/$1/.pgpass
        chmod 600 /home/$1/.pgpass
        gpasswd -a $1 wheel 
        chown -R $1:$1 /opt/fidm
        echo "User $1 has been created"
    fi
    echo -e "$2\n$2\n" | su - postgres -c "createuser --createdb --username postgres --createrole --no-superuser --pwprompt $1"
    echo "Database user $1 created."
}

# This script will create fidm user and supplied with password from user.
read -s -p "Database password for fidm: " firstpass
echo
read -s -p "Re-type password for fidm: " secondpass
#echo
#echo $firstpass
#echo $secondpass

if [ "$firstpass" == "$secondpass" ]
then
    cr_fidm fidm $firstpass
else
    echo
    echo "Password does not match!"
    exit 0
fi

