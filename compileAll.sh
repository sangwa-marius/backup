#!/bin/bash
set -euo pipefail
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
NC="\033[0m"
printf "${BLUE}====================================\n${NC}"
printf "${YELLOW}A simple compiler for all c programs${NC}\n"
printf "${BLUE}====================================\n${NC}"

read -p "Enter the path to the folder: " targetFolder

cd "$targetFolder"

mkdir -p bin

for file in *.c; do
  filename="$file"
  output=${file%.c}
  printf "${BLUE}Removing any duplicate $output...${NC}\n"
  sleep 2
  rm -f "bin/$output"
  printf "${BLUE}Compiling $file...${NC}\n"
  sleep 2
  if gcc "$file" -o "bin/$output"; then
    printf "${BLUE}Running $output...${NC}\n"
    sleep 2
    ./bin/$output
    echo
    echo
    echo
  fi
done
echo -e "${YELLOW}=======Compilation successful=======${NC}"
