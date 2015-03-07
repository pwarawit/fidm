FIDM Installation Instruction
====
This document describes the steps to install various components of FIDM (Financial DataMart). 

# High level steps
1. Update CentOS 7 package repository and install git (to get this repo) - this step need to be executed as root.

  * update yum repository
  ```
  # yum -y update all
  ```

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

2. 

