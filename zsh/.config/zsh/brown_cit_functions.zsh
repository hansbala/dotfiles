#!/bin/sh

# Deprecated:= using key value pairs now with pk-ssh
# Function to ssh into hbala's CIT account on CIT machines
# cit_hans () {
#   PSS_PATH=~/.config/passwords/.brown_password.txt
#   SRV_PATH=hbala@ssh.cs.brown.edu
#   sshpass -f $PSS_PATH ssh $SRV_PATH
# }

# Mounts the Brown CS department file system to ~/Documents/local_mnt/CIT/
# A prerequisite for this is for OS X Fuse to be installed on the computer
citmount () {
  MNT_PATH=~/Documents/local_mnt/CIT
  SRV_PATH=hbala@pk-ssh.cs.brown.edu
  RES=`mount | grep -w "CIT" | wc -l`

  if [ $RES -gt 0 ]; then
    echo "CIT already mounted to local filesystem"
  else
    mkdir -p $MNT_PATH
    sshfs -o reconnect $SRV_PATH:/home/hbala $MNT_PATH -ovolname=CIT \
      && \
    echo "Successfully mounted CIT to local filesystem"
  fi
}

# SSHs into my account on the Brown CIT machines
cit () {
  SRV_NAME=pk-ssh.cs.brown.edu
  USR_NAME=hbala
  ssh $USR_NAME@$SRV_NAME
}

# Create a new python3.8 virutal environment for CSCI1410 on local filesystem
create_venv () {
  virtualenv --python=python3.8 venv
  source ./venv/bin/activate
  [ -f requirements.txt ] && pip3 install -r requirements.txt
}
