#!/usr/bin/env bash

source ~/.colors.sh


clear
gum style \
--foreground 55 \
--border double \
--border-foreground 55 \
--bold \
--width 50 \
--align center \
"CHECK YOUR BODY MASS INDEX"

weight=$(gum input --placeholder="Enter your mass (Kg)")
height=$(gum input --placeholder="Enter your height (metres)")
square_height=$(echo "scale=5; $height*$height" | bc )
BMI=$(echo " scale=5; $weight/$square_height" | bc )



printf "Your Body Mass Index is ${BOLD_CYAN}%.1f${BOLD_GREEN}\n" $BMI

choice=$(gum confirm "Wanna check for more?" && echo "yes" || echo "no")

while [[ $choice == "yes" ]]; do
    weight=$(gum input --placeholder="Enter your mass (Kg)")
    height=$(gum input --placeholder="Enter your height (metres)")
    square_height=$(echo "scale=5; $height*$height" | bc )
    BMI=$(echo " scale=5; $weight/$square_height" | bc )
    printf "Your Body Mass Index is ${BOLD_CYAN}%.1f${BOLD_GREEN}\n" $BMI
    choice=$(gum confirm "Wanna check for more?" && echo "yes" || echo "no")
done

echo -e "${BOLD_YELLOW}Thank you. Hope you will be back soon${NC}"