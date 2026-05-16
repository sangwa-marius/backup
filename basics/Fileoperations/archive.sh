#!/usr/bin/env bash

HOME="$HOME"

read -p "Enter the name of the archive: " archive
if [[ -z $archive ]]; then
    echo "archive name should be provided! Exiting..."
    sleep 2
    exit 1
fi

if [[ ${#archive} -gt 10 ]]; then
    echo "archive name should be atmost 10 characters long"
    exit 1
fi

read -p "Enter the path of the files to archive: " -a files
if [[ -z $files ]]; then
    echo "Files to archive are needed"
    exit 1
fi

archive_dir="$HOME/archives"

if [[ ! -d $archive_dir ]]; then
    echo "Building archive directory..."
    sleep 2
    mkdir $archive_dir
fi

echo -e "Archiving the files..."
tar -cvf "$archive.tar" "${files[@]}"
mv "$archive.tar" $archive_dir

echo -e "Files archived to path $archive_dir"






