
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

restore(){
    
    if [[ -d $backup_dir ]]; then
        echo "Available backups"
        ls $backup_dir
    else
        echo "No backups available"
        exit 1
    fi
    
    read -p "Enter the name of the folder you need to restore: " folder_to_back_Up
    read -p "Enter the path of the folder to copy the restored folder: " restore_path
    
    echo "Restoring the $folder_to_back_up to $restore_path..."
    sleep 3
    if mv "$backup_dir/$folder_to_back_Up" "$restore_path"; then
        echo "Restoration successful"
    else
        echo "Failed to restore the folder, please try again"
    fi
    
}