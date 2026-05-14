#!/usr/bin/env bash

RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
NC="\033[0m"
backup_dir="$HOME/backups"
backup(){
    read -p "Enter the path of the folder to backup: " path
    path="${path//\\//}"
    if [ ! -d "$path" ]; then
        echo -e "${RED}The folder doesn't exist${NC}"
        return
    fi
    
    date=$(date +%s)
    dest="$backup_dir/$(basename "$path")_$date"
    
    mkdir -p "$dest"
    
    echo -e "${BLUE}Backing up your folder...${NC}"
    sleep 2
    cp -r "$path" "$dest"
    echo -e "${YELLOW}Backup folder at $dest${NC}"
}


restore(){
    
    if [[ ! -d $backup_dir ]]; then
        echo -e "${RED}No backups found!${NC}"
        exit 1
    fi
    echo -e "${GREEN}Available backups${NC}"
    ls --color=auto "$backup_dir"
    
    read -p "Enter the backup folder to restore: " restore
    
    if [ ! -d "$backup_dir/$restore" ]; then
        echo -e "${RED}Invalid folder${NC}"
        return
    fi
    
    read -p " Enter the folder path to restore the backup: " folder
    path="${path//\\//}"
    if [ ! -d "$folder" ]; then
        echo "Creating a restoring folder...."
        sleep 2
        mkdir -p "$dest_rest"
    fi
    
    echo -e "${BLUE}Restoring....${NC}"
    sleep 2
    cp -r "$backup_dir/$restore" "$folder"
    echo -e "${YELLOW}Restored at $folder${NC}"
    
}


echo "======================================"
echo "               🧠                     "
echo "Welcome to a smart Backup &Restore tool"
echo "============Marius script=============="
echo "1. Back up"
echo "2. Restore"

read -p "Choose an option [1/2]" choice

if [ $choice -eq 1 ]; then
    sleep 2
    backup
    elif [ $choice -eq 2 ]; then
    sleep 2
    restore
else
    sleep 3
    echo "Invalid choice"
fi


