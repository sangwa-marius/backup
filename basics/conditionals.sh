#!/usr/bin/env bash

source ../colors.sh

figlet -cf slant -w 100 "Age   checker" | lolcat
while true; do
    
    read -p "Hello , I 'm Your age checker. Who are you? " name
    
    if [[ -z $name ]]; then
        echo -e "${BOLD_RED}You should provide your name pls! Exiting...${NC}"
        sleep 2
        exit 1
    fi
    
    read -p "Hello $name, How old are you?  "  age
    if [[ -z $age ]]; then
        echo -e "${BOLD_RED}You should provide your age pls. Exiting...${NC}"
        sleep 2
        exit 1
    fi
    
    pattern=([^0-9])
    
    if [[ $age =~ $pattern ]]; then
        echo -e "${BOLD_RED}The age should be a number${NC}"
        exit 1
    fi
    
    if [[ ${#age} -gt 3 ]]; then
        echo  -e "${BOLD_RED}Too old${NC}"
        exit 1
    fi
    
    if [[ $age -lt 18 ]]; then
        remaining=$((18-age))
        printf "${BLUE}Ooh! sorry %s you will be allowed to vote in next %i years\n${NC}" "$name" "$remaining"
    else
        printf "${GREEN}Congz %s, you can now vote\n${NC}" "$name"
    fi
    
    read -p "Do you wanna check for more people?[Y/N] " choice
    if [[ ! $choice =~ [Yy] ]]; then
        printf "${BOLD_YELLOW}Thanks for using the age checker, see you later!${NC}\n"
        break
    fi
    
done