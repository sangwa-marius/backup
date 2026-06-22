#!/usr/bin/env bash
source ~/.colors.sh
source ./patterns.sh
count=0


if [[ ! -d $1 && ! -f $1 ]]; then
    echo -e "${RED}[Error]: No such file of directory, $1 ${NC}"
    exit
fi
ls -lhsi  $1 > ~/detail.txt

file_color=""

while FS= read -r inode du permissions links owner group size month day Time file_name; do
    ((count++))
    if [[ $count -eq 1 ]]; then
        continue
    fi
    
    if [[ -d "$1/$file_name" ]]; then
        file_color="${BOLD_BLUE}"
        elif [[ $file_name =~ $symlink_pattern ]]; then
        file_color="${BOLD_CYAN}"
        elif [[ -f "$1/$file_name" && -x $file_name ]]; then
        file_color="${BOLD_GREEN}"
        elif [[ -f "$1/$file_name" && ! -x $file_name ]]; then
        file_color="${GREEN}"
    fi
    printf "%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-3s %-3s %-10s $file_color%s${NC}\n" "$inode" "$du" "$permissions" "$links" "$owner" "$group" "$size" "$month" "$day" "$Time" "$file_name"
    echo -e "───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────"
done < ~/detail.txt
