#!/usr/bin/env bash

. ../colors.sh

read -p "Enter your password: " password

lower='[a-z]'
upper='[A-Z]'
num='[0-9]'
special='[^a-zA-Z0-9]'

while [[ ! $password =~ $lower || ! $password =~ $upper || ! $password =~ $num || ! $password =~ $special ]]; do
    if [[ ! $password =~ $lower ]]; then
        echo -e "${RED}Password should contain atleast one lowercase character${NC}\n"
        elif [[ $passwd =~ $upper ]]; then
        echo -e "${RED}Password should contain atleast one uppercase character${NC}\n"
        elif [[ ! $password =~ $num ]]; then
        echo -e "${RED}Password should contain atleast one number${NC}\n"
        elif [[ ! $password =~ $special ]]; then
        echo -e "${RED}Password should contain atleast one special character${NC}\n"
    fi
    
    read -p "Re-Enter the password: " password
done

echo -e "${BOLD_BLUE}Welcom!!!!${NC}\n"

patten="^([a-zA-Z0-9.+_%]+)@([a-zA-Z0-9-]+)\.[a-zA-Z]{2,4}$"
read -p "Enter YOur email: " email

if [[ $email =~ $patten ]]; then
    echo "Valid email"
    echo "Username     ${BASH_REMATCH[1]}"
    echo "Provider      ${BASH_REMATCH[2]}"
else
    echo "Invalid Email"
fi
