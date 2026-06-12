#!/usr/bin/env bash

source ~/.colors.sh

printf "\n${BOLD_BLUE}%-5s%-30s %-30s %-15s %s\n" "  No" "    Student names" " Email" " Marks" "  Grade"
printf "%-5s %-30s %-30s %-15s %s\n${NC}" "  --" "   -------------" "-----" "-----" " -----"

count=0
sum=0

while IFS=, read -r names email marks; do
    
    ((count++))
    
    sum=$((sum+marks))
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
    
    printf "+------+----------------------------+------------------------------+----------+-----------+\n"
    printf "%-5s%-30s %-30s %-15s %s\n" "|  $((count-1))" "  |    $names" "| $email" "| $marks       |" " $grade     |"
done < data.csv

count=$((count-1))
average_marks=$((sum/count))
average="Average Marks"
if [[ $average_marks -lt 50 ]]; then
    marks_color="${BOLD_RED}"
    grade="F"
    
    elif [[ $average_marks -ge 50 && $marks -lt 70 ]]; then
    marks_color="${BOLD_PURPLE}"
    grade="C"
    
    elif [[ $average_marks -ge 70 && $marks -lt 90 ]]; then
    marks_color="${BOLD_YELLOW}"
    grade="B"
    
else
    marks_color="${BOLD_GREEN}"
    grade="A"
    
fi
printf "+------+----------------------------+------------------------------+----------+-----------+\n"
printf "|${BOLD_GREEN}%-83s $marks_color%s${NC}   |\n"  "  $average"   "$average_marks"
printf "+-----------------------------------------------------------------------------------------+\n"

data_count=0
while IFS=, read -r names email marks; do
    ((data_count++))
    if [[ $data_count -eq 1 ]]; then
        continue
    fi
    echo -e "Sending Email to $email..."
    if echo -e "Subject:Marks\n\nHello $names! your marks are $marks and your grade is $grade" | msmtp $email; then
        echo -e "${BOLD_YELLOW}Email sent to: $email${NC}\n"
    else
        echo -e "${RED}[Error]: Failed to send email to $email${NC}\n"
    fi
done < data.csv




