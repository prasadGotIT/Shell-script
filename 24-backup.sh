#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOGS_FILE

if [ $USERID -ne 0 ]; then
   echo "ERROR::Please run this script with root privelege"
   exit 1
fi
USAGE(){

    echo "Usage :: sudo sh 24-backup.sh <SOURCE_DIR> <Dest_DIR> <Days>,default 14 days"
    exit 1
}
if [ $# -lt 2 ]; then
   USAGE
fi

if [ ! -d  $SOURCE_DIR ]; then

echo -e "$R $SOURCE_DIR does not exist $N"
exit 1

fi

if [ ! -d  $DEST_DIR ]; then

echo -e "$R $DEST_DIR does not exist $N"
exit 1

fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime $DAYS)

if [ ! -z "${FILES}" ]; then
   echo "Files found"
   TIMESTAMP=$(date +%F-%H-%M)
   ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
else
   echo "No files to archeive"
fi