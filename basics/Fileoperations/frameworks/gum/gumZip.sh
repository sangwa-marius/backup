#!/usr/bin/env bash

source ~/.colors.sh

clear

gum style \
--padding "1 2" \
--margin "2 2" \
--border rounded \
--border-foreground 120 \
--align center \
--foreground 120 \
--width 50 \
--bold "⚡ GUM ZIP ⚡" "Zip your file"


file_path=$(
    gum input \
    --placeholder="Enter a path of the file to zip" \
    --placeholder.foreground 212
    )

if [[ -z $file_path ]]; then
echo -e "${RED}The file path can't be empty${NC}\n"
exit 1
fi

if [[ ! -f "$file_path" ]]; then
echo -e "${RED}No such file${NC}\n"
exit 1
fi

gzip_files="$HOME/gzip_files"

if [[ ! -d $gzip_files ]]; then
confirmation=$(gum confirm "Need to create a separate folder to hold gzip files?" && echo "yes" || echo "no") 
if [[ $confirmation != "yes" ]]; then
echo -e "${RED}User denied to create a separate folder for zipped files${NC}\n"
else
gum spin \
--spinner moon \
--title="Creating $gzip_files..." \
--title.foreground="50" \
-- sleep 3
mkdir $gzip_files
fi
fi

out_put_zipped_file="$file_path.gz"

gum spin \
--spinner moon \
--title="Zipping $file_path..." \
--title.foreground="50" \
-- sleep 3

gzip $file_path

gum spin \
--spinner moon \
--title="Re_allocating $out_put_zipped_file..." \
--title.foreground="50" \
-- sleep 3

mv $out_put_zipped_file $gzip_files

echo -e "${WHITE}Now your zipped file was moved to ${BOLD_BLUE}$gzip_files/$(basename "$out_put_zipped_file")"




