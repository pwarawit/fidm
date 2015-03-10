FIDM Installation Instruction
====
This document describes the steps to install various components of FIDM (Financial DataMart). 

# High level steps
1. Install git and clone fidm repo
1. Install some important packages
1. Install PostgreSQL server 9.4

# Details steps
1. Install git and clone fidm repo
These steps need to be executed as root. 

  * Install git
  ```
  # yum -y install git
  ```
  
  * Configure git 
  ```
  # git config --global user.name "PanaEk Warawit"
  # git config --global user.email p.warawit@gmail.com
  ```
  
  * Clone fidm repo from github - you'll need to provide pwarawit user and password
  ```
  # cd /opt
  # git clone https://github.com/pwarawit/fidm.git
  ```
  Note: use `git pull origin master` to get latest fetch from the remote repo, and use `git push origin master` to push changes made locally (don't forget to add/commit first) to remote repo.

2. Install some important packages. 
These steps are included in file install_01.sh - it must be executed as root. The script do the following:
  * Update yum repository
  * Setup time zones 
  * Install some important packages : wget, screen, 


Create new virtualbox guest os - using the downloaded CentOS7 minimal ISO file 
parameter - 4GB of RAM, 20GB of Hard disk - use VHD (for compatibility with Hyper V)
with Network : Bridged Adapter , promiscuous - allow all. 

Then install the server - root password: 

this is all console, text based. 

Modify the following command to change the screen size of the console to 1024x768

#vi /etc/default/grub → in this file - add into the GRUB_CMD_LINE_LINUX this clause vga=791
Then run this
#grub2-mkconfig -o /boot/grub2/grub.cfg

3. Install PostgreSQL 9.4 -- using install_02.sh
This script will install and configure postgresql9.4 - it will pause and ask for the password of postgres user.

