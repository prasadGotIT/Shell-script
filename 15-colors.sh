#!/bin/bash

R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo -e "ERROR: $R Please run this script with ROOT access $N"
   exit 1
fi

VALIDATE(){
    if [$1 -ne 0 ]; then
       echo "ERROR::Installation $2 is... $R Failed $N "
       exit 1
    else
       echo "Installation $2 is.. $G Success $N "
    fi
}

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install python3 -y
VALIDATE $? "PYTHON"