#!/bin/bash

echo " please enter a number "
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    
   echo " Given number $NUMBER is Even"
else
   echo "Given number $NUMBER is odd"

 fi     