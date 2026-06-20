#!/usr/bin/env bash

. ~/.colors.sh
. ./patterns.sh

toilet -cf small -F metal Email Extractor

read -p "Enter the path of the file to extract emails from: " email_container_path
if [[ -z $email_container_path ]]; then
    printf "${RED}File path cannot be empty. Exiting...\n${NC}"
    sleep 2
    exit 1
    elif [[ ! -f $email_container_path ]]; then
    printf "${RED}File does not exist. Exiting...\n${NC}"
    sleep 2
    exit 1
fi

basename=$(basename "$email_container_path")
file_ext=""

if [[ $basename =~ $file_pattern ]]; then
    file_ext="${BASH_REMATCH[1]}"
else
    echo "File path doesn't match the pattern"
    exit
fi

extracted_email_output_dir="$HOME/extracted_emails"

extracted_email_output_file="$extracted_email_output_dir/${basename%.$file_ext}_output.$file_ext"

if [[ ! -d $extracted_email_output_dir ]]; then
    echo -e  "${GREEN}Building output directory...${NC}"
    mkdir $extracted_email_output_dir
fi

if grep -Eo $email_pattern $email_container_path | sort -u > "$extracted_email_output_file"; then
count=$(grep -Ec "$email_pattern" "$extracted_email_output_file")
    echo -e "Extracted ${BLUE}$count${NC} emails from ${BOLD_YELLOW}$email_container_path ${NC}, removed duplicates , sorted them and saved them in ${BOLD_YELLOW}$extracted_email_output_file${NC}"
else
    echo "Failed to extract emails"
fi





