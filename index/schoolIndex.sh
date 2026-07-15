#!/usr/bin/env bash

if [[ -f ../gumColors.sh ]]; then
    . ../gumColors.sh
else
    gum style --foreground 99 "Critical err: ../gumColors.sh not found"
fi

clear

students_read_file="../View/students.sh"
students_record_file="../Records/students.sh"
teachers_read_file="../View/teachers.sh"
teachers_record_file="../Records/teachers.sh"

app=$(
    gum style \
    --foreground "$FOREST_GREEN" \
    --border rounded \
    --width 30 \
    --border-foreground "$FOREST_GREEN" \
    --bold \
    --align center \
    "School Management System"
)

gum style \
--foreground "$ELECTRIC_BLUE" \
--border double \
--width 50 \
--border-foreground "$ELECTRIC_BLUE" \
--bold \
--margin "1 0" \
--align center \
"WELCOME TO OUR" "$app"

password=$(
    gum input \
    --password \
    --placeholder "Enter the password" \
    --cursor.foreground $ELECTRIC_BLUE \
    --prompt.foreground $ELECTRIC_BLUE
)

if [[ -z $password ]]; then
    gum style --foreground $RED "Password cannot be empty. Exiting..."
    sleep 2
    exit 1
fi


count=1

while [[ $password != "sanMariento" ]]; do
    
    if [[ $count -ge 6 ]]; then
        gum style --foreground $RED "Attempts over! Exiting..."
        sleep 2
        exit 1
    fi
    
    password=$(gum input \
        --password --placeholder "Wrong password. try again[attempt $count/5]" \
        --placeholder.foreground $DARK_RED \
        --cursor.foreground $RED \
        --prompt.foreground $RED \
        
    )
    ((count++))
done

gum style \
--foreground "$FOREST_GREEN" \
--margin "1 0" \
--bold "ACCESS GRANTED"




choice=$(
    gum choose "1. Read" "2. Record" \
    --header "Options" \
    --header.foreground "$ELECTRIC_BLUE" \
    --cursor.foreground "$FOREST_GREEN"
)

if [[ "$choice" == "1. Read" ]]; then
    choice2=$(
        gum choose "1. Teachers" "2. Students" \
        --header "Read" \
        --cursor.foreground "$FOREST_GREEN" \
        --header.foreground "$ELECTRIC_BLUE"
    )
    
    if [[ "$choice2" == "1. Teachers" ]]; then
        bash "$teachers_read_file"
    fi
    
    if [[ "$choice2" == "2. Students" ]]; then
        bash "$students_read_file"
    fi
    
fi

if [[ "$choice"  == "2. Record" ]]; then
    choice3=$(
        gum choose "1. Teachers" "2. Students" \
        --header "Record" \
        --header.foreground "$ELECTRIC_BLUE" \
        --cursor.foreground "$FOREST_GREEN"
    )
    
    if [[ "$choice3" == "1. Teachers" ]]; then
        bash "$teachers_record_file"
    fi
    
    if [[ "$choice3" == "2. Students" ]]; then
        bash "$students_record_file"
    fi
fi

