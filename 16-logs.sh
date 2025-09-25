#!/bin/bash
R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"

LOGS_FOLDER="\var\log\shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"


USERID=$(id -u)

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOGS_FILE

if [ $USERID -ne 0 ]; then
   echo -e "ERROR: $R Please run this script with ROOT access $N"
   exit 1
fi

VALIDATE(){
    if [$1 -ne 0 ]; then
       echo "ERROR::Installation $2 is... $R Failed $N " | tee -a $LOGS_FILE
       exit 1
    else
       echo "Installation $2 is.. $G Success $N " | tee -a $LOGS_FILE
    fi
}

dnf install nginx -y &>>$LOGS_FILE
VALIDATE $? "Nginx"

dnf install mysql -y &>>$LOGS_FILE
VALIDATE $? "MYSQL"

dnf install python3 -y &>>$LOGS_FILE
VALIDATE $? "PYTHON"