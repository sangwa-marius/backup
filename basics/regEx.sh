#!/usr/bin/env bash

. ../colors.sh

read -p "Enter your password: " password


if [[ "${#password}" -lt 8 ]]; then
    printf "${RED}Password must be at least 8 characters long\n${NC}"
    exit
elif

[[ ! $password =~ [A-Z] ]]; then
    printf "${RED}Password must contain at least one uppercase letter\n${NC}"
    exit
    elif [[ ! $password =~ [a-z] ]]; then
    printf "${RED}Password must contain at least one lowercase letter\n${NC}"
    exit
    elif [[ ! $password =~ [0-9] ]]; then
    printf "${RED}Password must contain at least one digit\n${NC}"
    exit
    elif [[ ! $password =~ [^a-zA-Z0-9] ]]; then
    printf "${RED}Password must contain at least one special character\n${NC}"
    exit
else
    printf "${BLUE}Password is valid! Welcome to your simple data recording bash script\n${NC}"
fi