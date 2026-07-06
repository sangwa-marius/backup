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

while true; do
    weight=$(
        gum input \
        --placeholder="Enter your mass (Kg)" \
        --placeholder.foreground 35 \
        --prompt.foreground 35 \
        --cursor.foreground 35
    )
    
    height=$(
        gum input \
    --placeholder="Enter your height (metres)" --placeholder.foreground 35 --prompt.foreground 35 --cursor.foreground 35)
    square_height=$(echo "scale=5; $height*$height" | bc )
    BMI=$(echo " scale=5; $weight/$square_height" | bc )
    printf "Your Body Mass Index is ${BOLD_CYAN}%.1f${BOLD_GREEN}\n" $BMI
    if ! gum confirm "Wanna check for more?" --prompt.foreground 40 --selected.background 40 --unselected.foreground 60; then
        break
    fi
    
done

echo -e "${BOLD_YELLOW}Thank you. Hope you will be back soon${NC}"