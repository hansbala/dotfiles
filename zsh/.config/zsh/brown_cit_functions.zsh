#!/bin/sh

init_password_files () {
  PSS_PATH=~/.config/passwords/.brown_password.txt
  if [ -f $PSS_PATH ]; then
    HANS_CIT_PWD=`bw get item 34457f11-f7d5-4fbd-9f8d-ab8c00b6ce93 --raw --pretty | \
      grep '"password":' | awk '{print $2}' | sed 's/[",]//g'`
    echo $HANS_CIT_PWD > $PSS_PATH
  fi
}

# Function to ssh into hbala's CIT account on CIT machines
cit_hans () {
  init_password_files()
  PSS_PATH=~/.config/passwords/.brown_password.txt
  SRV_PATH=hbala@ssh.cs.brown.edu
  sshpass -f $PSS_PATH ssh -X $SRV_PATH
}

# Mounts the Brown CS department file system to ~/Documents/local_mnt/CIT/
# A prerequisite for this is for OS X Fuse to be installed on the computer
cit () {
  init_password_files()
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
    -ovolname=$VOL_NAME -o password_stdin
    echo "Successfully mounted CIT to local filesystem"
  fi
}
