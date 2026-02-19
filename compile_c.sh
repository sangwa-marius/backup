#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./compile_c.sh filename.c"
  exit 1

fi

filename="$1"
output="${filename%.c}"

echo "Compiling $filename..."

gcc "$filename" -o "$output"

if [ $? -eq 0 ]; then
  echo "Running $output..."
  ./"$output"

else
  echo "Compilation error"

fi
