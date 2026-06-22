#!/usr/bin/env bash

clear

gum style \
--border-foreground 100 \
--foreground 100 \
--border thick --align center \
--width 50 \
--bold "BASH FRAMEWORKS" \
"Bash is becoming sweeter with gum framework"

choice=$(gum confirm "Are you sure you wanna continue use this tool?" && echo "yes" || echo "false")

if [[ $choice != "yes" ]]; then
    echo -e "Thank you"
    exit
fi

username=$(gum input --placeholder="What is your name?")
age=$(gum input --placeholder="Enter your age..." )

declare -i remaining

if [[ $age -lt 18 ]]; then
    remaining=$((18-age))
fi

echo -e "\n"
gum spin \
--spinner moon \
--spinner.foreground="50" \
--title="Processing your information" \
--title.foreground="50" \
-- sleep 3


[[ $age -gt 18 ]] && echo "Congs $username! You are allowed to vote" || echo "Sorry $username! You can't vote now. Wait for about $remaining years"
echo -e "\n"