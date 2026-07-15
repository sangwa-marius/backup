#!/usr/bin/env bash

if [[ -f ../gumColors.sh ]]; then
    source ../gumColors.sh
else
    echo "Critical Error: ../gumColors.sh is missing"
    exit 1
fi

Db_File="../Db/Local/SchoolDb/teachers.csv"



while true; do
    clear
    if [[ -f "$Db_File" ]]; then
        gum table -b   normal --header.foreground $FOREST_GREEN --selected.foreground $GREEN <$Db_File >/dev/null
    else
        echo "$Db_File does not exist."
    fi
    
    teacher_email=$(awk -F ',' 'NR>1{print $3}' "$Db_File" | gum filter \
        --placeholder "Filter by email to get details" \
        --prompt.foreground "$FOREST_GREEN" \
        --cursor-text.foreground "$FOREST_GREEN" \
        --indicator.foreground "$FOREST_GREEN" \
        
    )
    
    if [[ -z $teacher_email ]]; then
        gum style --foreground "$RED" "Pls select an email"
        exit 1
    fi

    row=$(grep "$teacher_email" "$Db_File")
    
    IFS=, read -r date name email age subject school <<< $row

    gum style \
            --border normal \
            --padding "1 2" \
            --width 50 \
            --bold  \
            --margin "1 0" \
            --border-foreground "$FOREST_GREEN" \
            "Name   : $name" \
            "Email  : $email" \
            "Age    : $age" \
            "Subject: $subject" \
            "School : $school" \
            
    
    if ! gum confirm "Wanna Go back to table?" --prompt.foreground $FOREST_GREEN --selected.background $FOREST_GREEN; then
        echo "Thank you"
        break
    fi
done