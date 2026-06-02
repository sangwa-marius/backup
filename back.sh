#!/usr/bin/env bash

. ./colors.sh

backup_dir="$HOME/backups"

backup(){
    read -p "Enter the path of the folder to backup: " path
    if [[ ! -d $path ]]; then
        echo -e "${RED}The folder doesn't exits${NC}"
        return
    fi

    if [[ ! -d $backup_dir ]]; then
    echo -e "${BLUE}Creating a backup directory...${NC}"
    mkdir $backup_dir
    echo "Done"
    fi

    date=$(date +"%s")
    desination="$backup_dir/$(basename $path)_$date"

    echo -e "${BOLD_BLUE}Backing up your folder...${NC}"
    cp -r $path $desination
    echo "Done"
    echo -e "Backed up ${BOLD_YELLOW}$path ${NC}to ${BOLD_YELLOW}$desination${NC}" 
    return  
}


toilet -cf slant -F metal Backup


backup