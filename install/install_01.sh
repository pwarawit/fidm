#!/usr/bin/env bash

# Update all the yum repositories
yum -y update all

# install & configure ntp - network time protocol to sync system date/time
yum -y install ntp
chkconfig ntpd on
ntpdate pool.ntp.org
service ntpd start

# Set local timezone to be Asia/Bangkok
timedatectl set-timezone Asia/Bangkok

# Install some utilities packages : wget, screen, 
yum -y install wget screen zip unzip


