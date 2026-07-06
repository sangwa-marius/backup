#!/usr/bin/env bash

source ../../colors.sh

HOME="$HOME"

toilet -cf small -F metal Archive maker

read -p "Enter the name of the archive: " archive
if [[ -z $archive ]]; then
    echo -e "${RED}Archive name should be provided! Exiting...${NC}"
    sleep 2
    exit 1
fi

if [[ ${#archive} -gt 10 ]]; then
    echo -e "${RED}Archive name should be atmost 10 characters long${NC}"
    exit 1
fi

read -p "Enter the path of the files to archive: " -a files
if [[ -z $files ]]; then
    echo -e "${RED}Files to archive are needed${NC}"
    exit 1
fi

archive_dir="$HOME/archives"

if [[ ! -d $archive_dir ]]; then
    echo -e "${YELLOW}Building archive directory...${NC}"
    sleep 2
    mkdir $archive_dir
fi

echo -e "${GREEN}Archiving the files...${NC}"
tar -cvf "$archive.tar" "${files[@]}"
mv "$archive.tar" $archive_dir

echo -e "${GREEN}Files archived to path ${BOLD_YELLOW}$archive_dir${NC}"






