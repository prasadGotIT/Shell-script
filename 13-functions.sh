#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR: Please run this script with ROOT access"
   exit 1
fi

VALIDATE(){
    if [$1 -ne 0 ]; then
       echo "ERROR::Installation $2 is Failed"
       exit 1
    else
       echo "Installation $2 is Success"
    fi
}

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install python3 -y
VALIDATE $? "PYTHON"
