#!/usr/bin/env bash

source ../colors.sh

read -p "Enter your age: " age

if [[ ${#age} == 0 ]]; then
echo Age is required
exit
fi

if [[ ! $age =~ ^[0-9]+$ ]]; then
echo Age should be an integer
exit
fi

case 1 in
$((age<13)))echo "You are a child";;
$((age >=13 && age <19)))echo "You are a teen";;
*)echo "You are an adult";;
esac

read -p "Enter your  marks: " marks

case "$marks" in
[0-5][0-9])echo "Grade F (00-59)";;
[6-7][0-9])echo "Grade C (60-79)";;
[8][0-9])echo "Grade B (80-89)";;
[9][0-9] | "100")echo "Grade A (90-100)";;
*)echo -e "${BOLD_RED}Marks out of bounds. Enter valid marks (00-100)${NC}";;
esac