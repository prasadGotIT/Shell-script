#!/bin/bash

USERID = $(id -u)

if [ $USERID -ne 0 ]; then
   echo "Error:: Please run this script with root access"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo "Error:: mysql installation failed"
   exit 1
else
   echo "Installing mysql is Sucess"
fi 
