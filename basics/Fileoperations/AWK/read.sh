#!/usr/bin/env bash

source ~/.colors.sh

printf "${BOLD_BLUE}%-30s %-30s %-15s %s\n" "Student names" "Email" "Marks" "Grade"
printf "%-30s %-30s %-15s %s\n\n${NC}" "-------------" "-----" "-----" "-----"

count=0

while IFS=, read -r names email marks; do
((count++))
if [[ $count -eq 1 ]]; then
continue
fi

marks_color=""
grade=""

if [[ $marks -lt 50 ]]; then
marks_color="${RED}"
grade="F"
elif [[ $marks -ge 50 && $marks -lt 70 ]]; then
marks_color="${PURPLE}"
grade="C"
elif [[ $marks -ge 70 && $marks -lt 90 ]]; then
marks_color="${YELLOW}"
grade="B"
else
marks_color="${GREEN}"
grade="A"
fi

printf "$marks_color%-30s %-30s %-15i %s\n${NC}" "  $names" "$email" "$marks" "$grade"
echo "|--------------------------|-------------------------------|-----------|-------------|"
done < data.csv