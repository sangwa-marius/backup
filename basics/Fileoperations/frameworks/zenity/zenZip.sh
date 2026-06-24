#!/usr/bin/env bash

zenity --info \
--title="Welcome to Zenzip" \
--text="This is a good tool for zipping files\nPlace Ok to continue"

gzip_files="$HOME/gzip_files"

file_path=$(
    zenity --entry \
    --title="Require fild" \
    --text="Enter the path of the file to zip"
)

while [[ -z "$file_path "|| ! -f "$file_path" ]] ; do
    
    if [[ -z "$file_path" ]]; then
        zenity --error \
        --title="Empty" \
        --text="You should provide a path to a file to be zipped"
        
        elif [[ ! -f "$file_path" ]]; then
        zenity --error \
        --title="No such file" \
        --text="The path you provided was not found to be a file"
    fi
    
    file_path=$(
        zenity --entry \
        --title="Require fild" \
        --text="Enter the path of the file to zip"
    )
done

out_put_zipped_file="$file_path.gz"

(
    echo 0; sleep 1;
    echo 20; echo "#Zipping $file_path"; sleep 1
    gzip $file_path
    echo 40; sleep 1;
    echo 60; echo "#Re-allocating $out_put_zipped_file"; sleep 1;
    mv $out_put_zipped_file $gzip_files
    echo 80; sleep 1;
    echo 100; sleep 1;
) | zenity --progress \
--text="Zipping..." \
--percentage=0 \
--auto-close
zenity --info \
--title="Done" \
--text="Thank you! Your file has been\nzipped to $gzip_files/$out_put_zipped_file"

