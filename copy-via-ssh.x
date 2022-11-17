#!/bin/bash

echo "Hi, this is the uploader program, from your computer to a remote server."

echo
ssh_address="192.168.118.151"
user="coadmin"
folder="/home/coadmin/documents_for_lbte"
#folder=$1

if [ -z "$1" ]
  then
  path="./../LBTE-doc/17-11-2022/"
  echo "Folder to scroll auto-selected as : " $path
else
  path=$1
fi

#export $(grep -v '^#' .config | xargs)
#echo $SSH

read -p "Run [go] to start or [EXIT] to close : " command

if [ "$command" == "go" ]
  then
  echo "Selected path : " $path
  for file in "$path"*; do echo "$file"; done

  for file in "$path"*;
    do
    echo
    echo " - current file : " $file;
    read -p "  upload it? [Y/n] " cont
    if [ "$cont" != "n" ]
      then
      scp $file $user@$ssh_address:$folder
      #echo $USER @ $SSH : $PATH
      #scp $file $USER@$SSH:$PATH
    fi
  done

  echo "Goodbye."
else
  echo "Ok, Goodbye."
fi


#set -a # automatically export all variables
#source .config
#set +a
#echo $SSH
