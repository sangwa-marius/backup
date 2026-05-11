#!/bin/bash

YELLOW='\033[1;33m'
BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"

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