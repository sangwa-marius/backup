#!/usr/bin/env bash

email_pattern='[a-zA-Z0-9_%]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,}$'

if [[ -f ../gumColors.sh ]]; then
    source ../gumColors.sh
else
    echo "Critical Error: ../gumColors.sh is missing"
    exit 1
fi

file="../Db/Local/SchoolDb/students.csv"
framework="Powered by gum framework of Bash"
clear
style=$(gum style \
    --foreground $FOREST_GREEN \
    --align center \
    --border rounded \
    --width 40 \
    --border-foreground $FOREST_GREEN \
    --bold \
"$framework")

gum style \
--foreground $ELECTRIC_BLUE \
--border normal \
--align center \
--width 50 \
--margin "2 1" \
--border-foreground $ELECTRIC_BLUE \
--bold \
"STUDENT RECORDING PORTAL" "$style"



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
        --prompt.foreground $RED
    )
    ((count++))
done

gum style \
--foreground $BLUE \
--bold "Welcome again"




Students_fields=(
    "Student full name"
    "Student's age"
    "Student Email"
    "Student Current School"
    "Student city of birth"
    "Student mother country"
)

declare -A user_info

for field in "${Students_fields[@]}"; do
    user_info["${field}"]=$(
        gum input \
        --placeholder "Enter ${field}" \
        --prompt.foreground $ELECTRIC_BLUE \
        --cursor.foreground $ELECTRIC_BLUE
    )
    
    input="${user_info[$field]}"
    if [[ -z $input ]]; then
        gum style --foreground "$RED" "$field cannot be empty. Exiting..."
        exit
    fi

    if [[ "$field" == "Student's age" && ! "$input" =~ [0-9]+$ ]]; then
     gum style --foreground $RED "Age should be a positive integer. Exiting..."
        exit 1  
    fi
    
    if [[ "$field" == "Student Email"  && ! "$input" =~ $email_pattern  ]]; then
        gum style --foreground $RED "Invalid email format. Exiting..."
        exit 1  
    fi


done

cat <<EOF >>$file
[$(date +"%Y-%m-%d %H:%M:%S")],${user_info["Student full name"]},${user_info["Student's age"]},${user_info["Student Email"]},${user_info["Student Current School"]},${user_info["Student city of birth"]},${user_info["Student mother country"]}
EOF

if [[ $? -eq 0 ]]; then
    gum style --foreground $YELLOW "Information saved to $file"
fi

