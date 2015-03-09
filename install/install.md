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
  
  * Create fidm application home directory and initialize it
  ```
  # mkdir /opt/fidm
  # cd /opt/fidm
  ```


