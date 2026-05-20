#!/usr/bin/env bash

. ../colors.sh

while true; do
    read -p "Hello , I 'm Your age checker. Who are you? " name
    read -p "Hello $name, How old are you?  "  age
    if [[ $age -lt 18 ]]; then
        remaining=$((18-age))
        printf "${BLUE}Ooh! sorry %s you will be allowed to vote in next %i years\n${NC}" "$name" "$remaining"
    else
        printf "${GREEN}Congz %s, you can now vote\n${NC}" "$name"
    fi
    
    read -p "Do you wanna check for more people?[Y/N] " choice
    if [[  $choice != "Y" && $choice != "Yes" && $choice != "yes"  && $choice != "y" ]]; then
        printf "${YELLOW}Thanks for using the age checker, see you later!${NC}\n"
        break
    fi
    
done