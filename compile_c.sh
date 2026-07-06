#!/usr/bin/env bash

source ./colors.sh
set -eu

if [ -z "${1:-}" ]; then
    echo -e "${RED}Usage: $0 filename.c${NC}"
    exit 1
fi

mkdir -p bin
filename="$1"
output="${filename%.c}"

rm -f "bin/$output"

echo -e "${BLUE}[INFO] Compiling $filename${NC}"

if gcc "$filename" -o "bin/$output"; then
    echo -e "${GREEN}[INFO] Compilation successful${NC}"
    echo -e "${GREEN}[INFO] Running $output${NC}"
    ./bin/$output
else
    echo -e "${RED}[ERROR] Compilation failed with code $?.${NC}"
fi
