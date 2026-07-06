#!/usr/bin/env bash

source ../../colors.sh

toilet -cf slant -F metal "Sed Stream Editor"

data=("filePath" "old_text" "new_text")
declare -A prompt_data

for datum in "${data[@]}"; do
    read  -p "Enter ${datum}: " value
    prompt_data["${datum}"]=$value
done

sed -i "s/${prompt_data[old_text]}/${prompt_data[new_text]}/g" "${prompt_data[filePath]}"

count=$(grep -c "${prompt_data[old_text]}" "${prompt_data[filePath]}")

echo -e "\n${YELLOW}The total replacements were ${BOLD_YELLOW}$count${NC}"