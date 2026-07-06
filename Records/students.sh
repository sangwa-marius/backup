#!/usr/bin/env bash

source ../colors.sh

file="../Db/Local/SchoolDb/students.csv"

toilet -cf small -F metal Record

read -sp "Enter your password: " password
echo ""

if [[ -z $password ]]; then
    printf "${RED}Password cannot be empty. Exiting...\n${NC}"
    sleep 2
    exit 1
fi


count=1

while [[ $password != "sanMariento" ]]; do
    
    if [[ $count -ge 6 ]]; then
        echo -e "${BOLD_RED}Attempts over! Exiting...${NC}"
        sleep 2
        exit 1
    fi
    
    read -sp "Wrong password. try again[attempt $count/5]: " password
    echo ""
    ((count++))
done

printf "${BLUE}Hello Marius! Welcome to your simple data recording bash script\n${NC}"

read -p "Wanna read the data ? (y/n) " answer

answer_pattern="[Yy]"

if [[ $answer =~ $answer_pattern ]]; then
    if [[ -f "$file" ]]; then
        echo "Contents:"
        gum table -p  -b normal <$file
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
    if read -t 60 -p "Enter ${field} (You only have 60 seconds): " value;then
        user_info["${field}"]=$value
    else
        echo "Time's up for ${field}! Exiting."
        exit 1
    fi
done

cat <<EOF >>$file
[$(date +"%Y-%m-%d %H:%M:%S")],${user_info["Student full name"]},${user_info["Student's age"]},${user_info["Student Email"]},${user_info["Student Current School"]},${user_info["Student city of birth"]},${user_info["Student mother country"]}
EOF

if [[ $? -eq 0 ]]; then
    printf "${YELLOW}Information saved to $file${NC}\n"
fi

