#!/usr/bin/env bash

. ~/.colors.sh

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
    echo "Reading data from data.txt..."
    sleep 3
    if [[ -f "data.txt" ]]; then
        echo "Contents of data.txt:"
        while IFS= read -r line;do
		echo "$line"
		sleep 1
	done<data.txt
    else
        echo "data.txt does not exist."
    fi
else
    echo "Okay, let's write some data to data.txt"
fi


fields=("name" "age" "city" "country")
declare -A user_info

for field in "${fields[@]}"; do
   if read -t 60 -p "Enter the ${field} (You only have 60 seconds): " value;then
    user_info["${field}"]=$value
   else
    echo "Time's up for ${field}! Exiting."
    exit 1
  fi
done

cat <<EOF >>data.txt
--------------------------------------------
Date       [$(date +"%Y-%m-%d %H:%M:%S")]
Names      ${user_info["name"]}
Age        ${user_info["age"]}
City       ${user_info["city"]}
Country    ${user_info["country"]}
--------------------------------------------

EOF
printf "${YELLOW}Information saved to data.txt${NC}\n"
