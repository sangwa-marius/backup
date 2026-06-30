#!/usr/bin/env bash

. ~/.colors.sh
source ./functions/backUpFunctions.sh
toilet -cf slant -F metal Backup
echo "Choices:"
printf "1. Backup\n2. Restore\n"
read -p "Enter your choice: " choice
if [[ $choice -eq 1 ]]; then
    backup
    elif [[ $choice -eq 2 ]]; then
    restore
else
    echo "Incorrect choice"
fi