#!/usr/bin/env bash

GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"

printf "${BLUE}====================================\n${NC}"
printf "${BLUE}A simple compiler for all c programs\n${NC}"
printf "${BLUE}====================================\n${NC}"

read -p "Enter the path to the folder: " folder

files=("$folder"/*.c)

# Handle case: no C files found
if [ ! -e "${files[0]}" ]; then
    printf "${RED}No C files found in %s${NC}\n" "$folder"
    exit 1
fi

total=${#files[@]}
count=1

mkdir -p bin

for file in "${files[@]}"; do
    filename=$(basename "$file")
    output="bin/${filename%.c}"

    printf "\n${YELLOW}[%d/%d] Compiling %s${NC}\n" "$count" "$total" "$filename"

    rm -f "$output"

    if gcc "$file" -o "$output"; then
        printf "${GREEN}Running %s...${NC}\n" "${filename%.c}"
        ./"$output"
    else
        printf "${RED}Compilation failed for %s${NC}\n" "$filename"
        exit 1
    fi

    ((count++))
done

printf "\n${GREEN}======= Compilation successful =======${NC}\n"
