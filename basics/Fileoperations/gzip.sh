#!/bin/bash

YELLOW="\033[1;33m"
RED="\033[0;31m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
NC="\033[0m"

read -p "Enter a path of the file to zip: " file_path

if [[ -z $file_path ]]; then
    echo -e "${RED}The file path can't be empty! Exiting...${NC}"
    sleep 2
    exit 1
fi

if [[ ! -f $file_path ]]; then
    echo -e "${RED} No such file found${NC}"
    exit 1
fi

gzip_files="$HOME"/gzip_files

if [[ ! -d $gzip_files ]]; then
    echo -e "${GREEN}Creatin a folder to hold zipped files...${NC}"
    sleep 2
    mkdir $gzip_files;
fi

echo -e "${BLUE}Zipping $file_path...${NC}" 

gzip $file_path
output="$file_path.gz"
mv $output $gzip_files;

echo -e "${YELLOW}Zipping completed , You can find your zipped file in $gzip_files${NC}"
