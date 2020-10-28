#!/bin/sh

# Function to ssh into hbala's CIT account on CIT machines
# cit_hans () {
#   PSS_PATH=~/.config/passwords/.brown_password.txt
#   SRV_PATH=hbala@ssh.cs.brown.edu
#   sshpass -f $PSS_PATH ssh $SRV_PATH
# }

# Mounts the Brown CS department file system to ~/Documents/local_mnt/CIT/
# A prerequisite for this is for OS X Fuse to be installed on the computer
cit_mount () {
  MNT_PATH=~/Documents/local_mnt/CIT
  PSS_PATH=~/.config/passwords/.brown_password.txt
  USER_NAM=hbala
  SRV_PATH=hbala@ssh.cs.brown.edu
  VOL_NAME=CIT
  RES=`mount | grep -w "CIT" | wc -l`
  if [ $RES -gt 0 ]; then
    echo "CIT already mounted to local filesystem"
  else
    mkdir -p $MNT_PATH
    cat $PSS_PATH | sshfs -o reconnect $SRV_PATH:/home/$USER_NAM/ $MNT_PATH \
    -ovolname=$VOL_NAME -o password_stdin \
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
