#!/usr/bin/env bash
source ~/.colors.sh
count=0

# if [[ ! -d "$1" || ! -f "$1" ]]; then
# echo "table:cannot access $1: No such file or directory"
# exit
# fi

ls -lhsi  $1 > ~/detail.txt

while FS= read -r inode du permissions links owner group size month day Time file_name; do
((count++))
if [[ $count -eq 1 ]]; then
continue
fi
printf "${GREEN}%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-3s %-3s %-10s ${BOLD_BLUE}%s\n" "$inode" "$du" "$permissions" "$links" "$owner" "$group" "$size" "$month" "$day" "$Time" "$file_name"
echo -e "${GREEN}───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────${NC}"
done < ~/detail.txt
