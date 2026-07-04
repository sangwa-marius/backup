
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
    
    local date=$(date +"%s")
    local destination="$backup_dir/$(basename $path)_$date"
    
    echo -e "${BOLD_BLUE}Backing up your folder...${NC}"
    cp -r $path $destination
    echo "Done"
    echo -e "Backed up ${BOLD_YELLOW}$path ${NC}to ${BOLD_YELLOW}$destination${NC}"
    return
}

gumBack(){
    local path=$(
        find /home/marius -type d 2>/dev/null |  gum filter \
        --placeholder="Select a folder to backup" \
    )
    
    if [[ ! -d $backup_dir ]]; then
        gum spin \
        --spinner moon \
        --title="Creating a backup folder" \
        --title.foreground 50 \
        -- bash -c "mkdir $backup_dir"
    fi
    
    local date=$(date +"%s")
    local destination="$backup_dir/$(basename $path)_$date"
    
    gum spin \
    --spinner moon \
    --title="Sending email..." \
    --title.foreground 55 \
    -- bash -c "cp -r '$path' '$destination'"
    
    if [ $? -eq 0 ]; then
        echo -e "Backed up ${BOLD_YELLOW}$path ${NC}to ${BOLD_YELLOW}$destination${NC}"
    else
        echo "Failed to back up your folder"
    fi
    return
}
restore(){
    
    if [[ -d $backup_dir ]]; then
        echo "Available backups"
        
        if (shopt -s nullglob; set -- $backup_dir/*; (($# == 0))); then
            echo "Backups directory is empty"
            exit
        else
            echo "Avaliable backups"
            ls $backup_dir --color=auto
        fi
    else
        echo "No backup directory"
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