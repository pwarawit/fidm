#!/usr/bin/env bash

# Install java and set PENTAHO_JAVA_HOME variable
yum -y install java-1.7.0-openjdk.x86_64

# Check if pentaho user has been created, if not create one
if id -u "pentaho" > /dev/null 2>&1; then
    echo "pentaho user already exists"
else
    adduser pentaho
    echo "user pentaho created"
    echo "export PENTAHO_JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk" >> /etc/environment
    echo "export PENTAHO_JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk" >> /home/pentaho/.bash_profile
fi

# Modify firewall to allow port 8080
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload

# Create /opt/pentaho and download unzip pentaho software
mkdir /opt/pentaho
cd /opt/pentaho
wget http://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/5.3/biserver-ce-5.3.0.0-213.zip
# mkdir /opt/pentaho/server
# mv biserver-ce-5.3.0.0-213.zip server
# cd /opt/pentaho/server
unzip biserver-ce-5.3.0.0-213.zip

# Give the whole /opt/pentaho to pentaho
chown -R pentaho:pentaho /opt/pentaho

