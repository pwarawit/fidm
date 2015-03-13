FIDM Installation Instruction
====
This document describes the steps to install various components of FIDM (Financial DataMart). 

# High level steps
1. Install git and clone fidm repo
1. Install some important packages (install_01.sh)
1. Install PostgreSQL server 9.4 (install_02.sh)
1. Install phpPgAdmin & Apache (install_03.sh)

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
This script will install and configure postgresql9.4  - it must be executed as root.

4. Install phpPgAdmin & Apache -- using install_03.sh
This script must be executed as root.

5. Create user fidm and grant all required priviledgess -- using install_04.sh
This script will ask for password twice, record it into an environment variable and use it to supply as password for newnewly created linux user 'fidm'. The following components are in install_04.sh
  * asking for password
  * create fidm user role in postgres
  * create .pgpass file
  * make fidm owner of /opt/fidm
  * fidm can sudo

6. Create Pentaho user and install Pentaho -- using install_05.sh
This script must be executed as root. It will do the following:
  * Install java
  * If not exists, add linux user pentaho 
  * create /opt/pentaho, download the package and unzip it.

7. Create 3 pentaho-required databases on posgresql server -- using install_06.sh

8. Configure Pentaho by changing several xml, properties files to allow postgres as BA repository -- using install_07.sh

** Note on Mounting Windows Share 
# yum install samba-client samba-common cifs-utils
# mkdir /mnt/win
edit /etc/fstab -- add this line:
\\redwood.recoftc.org\fidm /mnt/win cifs user,uid=500,rw,suid,username=fidm,password=Samsung1987 0 0
# mount /mnt/win