#!/bin/bash
echo "All variables passed to script: $@"
echo "All variables passed to script: $*"
echo "script name: $0"
echo "current directory: $PWD"
echo "who is running the script: $USER"
echo "home directory of user: $HOME"
echo "PID of current script: $$"
sleep 50 &
echo "PID of last background command: $!"
echo "Total number of arguments passed: $#"
# End of script