#!/usr/bin/env bash

if [[ -f ../gumColors.sh ]]; then
    source ../gumColors.sh
else
    echo "Critical Error: ../gumColors.sh is missing"
    exit 1
fi

Db_File="../Db/Local/SchoolDb/students.csv"



while true; do
clear
if [[ -f "$Db_File" ]]; then
    echo "Contents:"
    gum table -b normal --header.foreground $FOREST_GREEN <$Db_File >/dev/null
else
    echo "$Db_File does not exist."
fi

Student_email=$(awk -F ',' 'NR>1{print $4}' "$Db_File" | gum filter \
    --placeholder "Filter by student email to get details" \
    --placeholder.foreground "$FOREST_GREEN"
)

while IFS=, read -r date name age email school city country; do
    if [[ "$email" == "$Student_email" ]]; then
        gum style \
        --border normal \
        --padding "1 2" \
        --width 40 \
        --bold  \
        "Name   : $name" \
        "Email  : $email" \
        "Age    : $age" \
        "City   : $city" \
        "Country: $country" \
        
    fi
done <"$Db_File"

if ! gum confirm "Wanna Go back to table?" --prompt.foreground $FOREST_GREEN --selected.background $FOREST_GREEN; then
echo "Thank you"
break
fi
done


