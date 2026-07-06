#!/usr/bin/env bash

if [[ -f ../gumColors.sh ]]; then
    source ../gumColors.sh
else
    echo "Critical Error: ../gumColors.sh is missing"
    exit 1
fi

file="../Db/Local/SchoolDb/students.csv"
clear
style=$(gum style \
--foreground $FOREST_GREEN \
--align center \
--border rounded \
--width 50 \
--border-foreground $ELECTRIC_BLUE \
--bold \
"Powered_by_gum_framework_of_Bash")

gum style \
--foreground $ELECTRIC_BLUE \
--border double \
--align center \
--width 70 \
--border-foreground $ELECTRIC_BLUE \
--bold \
"STUDENT RECORDING PORTAL" $style



password=$(gum input --password --placeholder "Enter the password" --cursor.foreground $ELECTRIC_BLUE --prompt.foreground $ELECTRIC_BLUE)

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

if gum confirm "Wanna read the data ?" --selected.background $FOREST_GREEN --prompt.foreground $FOREST_GREEN; then
    if [[ -f "$file" ]]; then
        echo "Contents:"
        gum table -p  -b normal --header.foreground $FOREST_GREEN <$file
    else
        echo "$file does not exist."
    fi
else
    echo "Okay, let's write some data to $file"
fi


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
        user_info["${field}"]=$(gum input --placeholder "Enter ${field}")
done

cat <<EOF >>$file
[$(date +"%Y-%m-%d %H:%M:%S")],${user_info["Student full name"]},${user_info["Student's age"]},${user_info["Student Email"]},${user_info["Student Current School"]},${user_info["Student city of birth"]},${user_info["Student mother country"]}
EOF

if [[ $? -eq 0 ]]; then
    gum style --foreground $GREEN "Information saved to $file"
fi

