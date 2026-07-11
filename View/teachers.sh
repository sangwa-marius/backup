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
    
    Student_email=$(awk -F ',' 'NR>1{print $3}' "$Db_File" | gum filter \
        --placeholder "Filter by student email to get details" \
        --prompt.foreground "$FOREST_GREEN" \
        --cursor-text.foreground "$FOREST_GREEN" \
        --indicator.foreground "$FOREST_GREEN" \
        
    )
    
    if [[ -z $Student_email ]]; then
        gum style --foreground "$RED" "Pls select an email"
        exit 1
    fi
    
    while IFS=, read -r date name email age subject school; do
        if [[ "$email" == "$Student_email" ]]; then
            gum style \
            --border normal \
            --padding "1 2" \
            --width 40 \
            --bold  \
            "Name   : $name" \
            "Email  : $email" \
            "Age    : $age" \
            "Subject: $subject" \
            "School: $school" \
            
        fi
    done <"$Db_File"
    
    if ! gum confirm "Wanna Go back to table?" --prompt.foreground $FOREST_GREEN --selected.background $FOREST_GREEN; then
        echo "Thank you"
        break
    fi
done