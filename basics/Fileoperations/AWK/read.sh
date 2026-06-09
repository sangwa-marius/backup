#!/usr/bin/env bash

printf "%-22s %-30s %s\n" "Student names" "Email" "Marks"
printf "%-22s %-30s %s\n" "-------------" "-----" "-----"

count=0

while IFS=, read -r names email marks; do
((count++))
if [[ $count -eq 1 ]]; then
continue
fi

printf "%-22s %-30s %s\n" "$names" "$email" "$marks"
done < data.csv