#!/usr/bin/env bash

source ~/.colors.sh


clear
gum style \
--foreground 50 \
--border double \
--border-foreground 40 \
--bold \
--width 50 \
--align center \
"CHECK YOUR BODY MASS INDEX"

count=1

while true; do
message=""
    weight=$(
        gum input \
        --placeholder="Enter your mass (Kg)" \
        --placeholder.foreground 35 \
        --prompt.foreground 35 \
        --cursor.foreground 35
    )

    if [[ -z $weight ]]; then
    echo "No weight provided"
    break
    fi
    
    height=$(
        gum input \
    --placeholder="Enter your height (metres)" --placeholder.foreground 35 --prompt.foreground 35 --cursor.foreground 35)
    
    if [[ -z $height ]]; then
    echo "No height provided"
    break
    fi

    square_height=$(echo "scale=5; $height*$height" | bc )
    BMI=$(echo " scale=5; $weight/$square_height" | bc )
    # if [[ $BMI -lt 18.9 ]]; then
    # message="${BOLD_RED}You are under weight${NC}"
    # elif [[ $BMI -gt 24.9 ]]; then
    # message="${BOLD_RED}You have obesity${NC}"
    # else
    # message="${YELLOW}You have no problem${NC}"
    # fi
    printf "${BOLD_CYAN}%i ${WHITE}Your weight is ${BOLD_CYAN}%.2f${WHITE}, your height is ${BOLD_CYAN}%.3f ${WHITE}and your Body Mass Index is ${BOLD_GREEN}%.1f${NC}$message\n" $count $weight $height $BMI
    if ! gum confirm "Wanna check for more?" --prompt.foreground 40 --selected.background 40 --unselected.foreground 60; then
        break
    fi
    ((count++)) 
done
echo -e "${BOLD_YELLOW}Thank you. Hope you will be back soon${NC}"