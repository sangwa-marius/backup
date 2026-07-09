#!/usr/bin/env bash

if [[ -f ../gumColors.sh ]]; then
    source ../gumColors.sh
else
    echo "Critical Error: ../gumColors.sh is missing"
    exit 1
fi

email_pattern="[a-zA-Z0-9.+%_]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}"
not_valid_positive_integer="[a-zA-Z]|[^a-zA-Z0-9]"
Db_File="../Db/Local/SchoolDb/teachers.csv"

powered=$(
    gum style \
    --foreground $FOREST_GREEN \
    --border normal \
    --width 40 \
    --border-foreground $FOREST_GREEN \
    --bold \
    --align center \
    "Powered by gum framework of Bash"
)

gum style \
--foreground $ELECTRIC_BLUE \
--border normal \
--border-foreground $ELECTRIC_BLUE \
--width 50 \
--align center \
--bold "TEACHER RECORDING PORTAL" "$powered"

fields=(
    "Full name"
    "Email"
    "Age"
    "Subject"
    "School"
)

while true; do

declare -A teacher_information

for field in "${fields[@]}"; do
    
    teacher_information[$field]=$(
        gum input \
        --placeholder "Enter $field" \
        --prompt.foreground $ELECTRIC_BLUE \
        --cursor.foreground $ELECTRIC_BLUE \
    )
    
    value="${teacher_information[$field]}"
    
    if [[ -z $value ]]; then
        gum style  --foreground $RED "$field cannot be empty. Exiting..."
        exit 1
    fi
    
    if [[ "$field" == "Email" && ! "$value" =~ $email_pattern ]]; then
        gum style  --foreground $RED "Invalid Email formart. Exiting..."
        sleep 2
        exit 1
    fi
    
    if [[ "$field" == "Age" ]]; then
        if [[ "$value" =~ $not_valid_positive_integer ]]; then
            gum style  --foreground $RED "Age should be a valid positive integer. Exiting..."
            sleep 2
            exit 1
        fi
        
        if [[ $value -le 0 ]]; then
            gum style  --foreground $RED "$value years really? Exiting..."
            sleep 2
            exit 1
        fi
    fi


done
cat <<EOF >> $Db_File
[$(date +"%Y-%m-%d %H:%M:%S")],${teacher_information["Full name"]},${teacher_information["Email"]},${teacher_information["Age"]},${teacher_information["Subject"]},${teacher_information["School"]}
EOF

if [[ $? -eq 0 ]]; then
gum style --foreground $FOREST_GREEN "Information saved to $Db_File"
fi

if ! gum confirm "Wanna record more teachers?" --prompt.foreground $ELECTRIC_BLUE --selected.background $FOREST_GREENk; then
gum style --foreground $ELECTRIC_BLUE "Thank you"
break
fi
done