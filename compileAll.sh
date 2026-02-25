#!/bin/bash
set -euo pipefail

echo "===================================="
echo "A simple compiler for all c programs"
echo "===================================="

read -p "Enter the path to the folder: " targetFolder

cd "$targetFolder"

mkdir -p bin

for file in *.c; do
  filename="$file"
  output=${file%.c}
  echo "Removing any duplicate $output..."
  sleep 2
  rm -f "bin/$output"
  echo "Compiling $file"
  sleep 2
  if gcc "$file" -o "bin/$output"; then
    echo "Running $output..."
    sleep 2
    ./bin/$output
    echo
    echo
    echo
  fi
done
echo "=======Compilation successful======="
