#!/usr/bin/env bash
. ./colors.sh
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
    folder="${folder//\\//}"
    if [ ! -d "$folder" ]; then
        echo "Creating a restoring folder...."
        mkdir -p "$dest_rest"
    fi
    
    echo -e "${BLUE}Restoring....${NC}
    cp -r "$backup_dir/$restore" "$folder"
    echo -e "${YELLOW}Restored at $folder${NC}"
    
}


toilet -cf small -F metal Backup - Restore     

echo "1. Back up"
echo "2. Restore"

read -p "Choose an option [1/2]" choice

if [[ -z $choice ]]; then
echo -e "${RED}You didn't provide any choice! Exiting...${NC}"
exit 1
fi

if [ $choice -eq 1 ]; then
    backup
    exit 0
    elif [ $choice -eq 2 ]; then
    restore
    exit 0
else
    echo -e "${RED}Invalid choice${NC}"
    exit 1
fi


