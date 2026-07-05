
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
    local choice=1
    while [[ $choice ]]; do
        local selected_dirs=()
        mapfile -t  selected_dirs < <(
            find $HOME -type d 2>/dev/null |  gum filter \
            --indicator.foreground 50 \
            --cursor-text.foreground 50 \
            --placeholder="Select a folder to backup" \
            --placeholder.foreground 40 \
            --prompt.foreground 40 \
            --match.foreground 50 \
            --selected-indicator.foreground 50 \
            --unselected-prefix.foreground 30 \
            --limit 30 \
            --text.foreground 30
        )
        
        if [[ ! -d $backup_dir ]]; then
            gum spin \
            --spinner moon \
            --title="Creating a backup folder" \
            --title.foreground 50 \
            -- bash -c "mkdir $backup_dir"
        fi
        
        local date=$(date +"%s")
        
        
        for folder in "${selected_dirs[@]}"; do
            local destination="$backup_dir/$(basename $folder)_$date"
            gum spin \
            --spinner moon \
            --title="Backing up $folder..." \
            --title.foreground 40 \
            -- bash -c "cp -r '$folder' '$destination'"
            
            if [ $? -eq 0 ]; then
                echo -e "Backed up ${BOLD_YELLOW}$folder ${NC}to ${BOLD_YELLOW}$destination${NC}"
            else
                echo "Failed to back up your folder"
            fi
        done
        
        if ! gum confirm "Do you wanna backup some more folders?" \
        --prompt.foreground 40 \
        --selected.background 40 \
        --selected.foreground 240 \
        --unselected.foreground 60;
        then
            break
        fi
    done
    gum style --foreground 50 --bold "Thank you"
    return
}
restore(){
    
    if [[ -d $backup_dir ]]; then
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

gumRestore(){
    local folders_to_restore=()
    local restore_path
    
    
    
    while true; do
        
        if [[ ! -d $backup_dir ]]; then
            echo "No backup directory found."
            return 1
        fi
        
        if (shopt -s nullglob; set -- "$backup_dir"/*; (($# == 0))); then
            gum style --foreground 50 --bold "Backups directory is empty"
            exit 1
        fi
        mapfile -t folders_to_restore < <(
            find "$backup_dir" -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | gum filter \
            --indicator.foreground 50 \
            --placeholder="Which folder(s) do you wanna restore? (Tab to select multiple)" \
            --placeholder.foreground 40 \
            --prompt.foreground 40 \
            --cursor-text.foreground 50 \
            --match.foreground 50 \
            --text.foreground 30 \
            --no-limit
        )
        
        
        if (( ${#folders_to_restore[@]} == 0 )); then
            echo "No folders selected."
            return 1
        fi
        
        restore_path=$(
            find "$HOME" -maxdepth 2 -type d ! -path '*/.*' 2>/dev/null | gum filter \
            --placeholder="Where do you wanna restore it to?" \
            --placeholder.foreground 40 \
            --prompt.foreground 40 \
            --indicator.foreground 50 \
            --selected-indicator.foreground 50 \
            --cursor-text.foreground 50 \
            --match.foreground 40
        )
        
        if [[ -z $restore_path ]]; then
            echo "No destination selected."
            break
        fi
        
        
        for folder in "${folders_to_restore[@]}"; do
            gum spin  \
            --spinner moon \
            --title="Restoring $folder..." \
            --title.foreground 100 \
            -- bash -c "mv '$backup_dir/$folder' '$restore_path/'"
            
            if [[ $? -eq 0 ]]; then
                echo -e "Restored ${BOLD_YELLOW}$folder${NC} to ${BOLD_YELLOW}$restore_path${NC}"
            else
                echo "Failed to restore $folder, please try again"
            fi
        done
        
        if ! gum confirm "Do you wanna backup some more folders?" \
        --prompt.foreground 40 \
        --selected.background 40 \
        --selected.foreground 240 \
        --unselected.foreground 60;
        then
            break
        fi
    done
    
    gum style --foreground 50 --bold "Thank you"
}