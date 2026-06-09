#!/usr/bin/env bash

source ~/.colors.sh

printf "${BOLD_BLUE}%-5s %-30s %-30s %-15s %s\n" "No" "Student names" "Email" "Marks" "Grade"
printf "%-5s %-30s %-30s %-15s %s\n\n${NC}" "--" "-------------" "-----" "-----" "-----"

count=0
sum=0

while IFS=, read -r names email marks; do
    declare -i integer_marks=$marks
    ((count++))
    sum=$((sum+integer_marks))
    if [[ $count -eq 1 ]]; then
        continue
    fi
    
    marks_color=""
    grade=""
    
    if [[ $marks -lt 50 ]]; then
        marks_color="${BOLD_RED}"
        grade="F"
        elif [[ $marks -ge 50 && $marks -lt 70 ]]; then
        marks_color="${BOLD_PURPLE}"
        grade="C"
        elif [[ $marks -ge 70 && $marks -lt 90 ]]; then
        marks_color="${BOLD_YELLOW}"
        grade="B"
    else
        marks_color="${BOLD_GREEN}"
        grade="A"
    fi
    
    printf "|----|--------------------------|-------------------------------|-----------|-------------|\n"
    printf "%-5s%-30s %-30s %-15s %s\n" "  $((count-1))" "    $names" "$email" "$marks" "$grade"
    sleep 0.02
done < data.csv

count=$((count-1))
average_marks=$((sum/count))
average="Average Marks"
printf "|-----------------------------------------------------------------------------------------|\n"
printf "${BOLD_GREEN}%-83s $marks_color%i${NC}\n"  "  $average"   "$average_marks"
printf "|-----------------------------------------------------------------------------------------|\n"



