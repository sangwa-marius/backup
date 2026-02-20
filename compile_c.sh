#!/bin/bash

set -eu

if [ -z "${1:-}" ]; then
  echo "Usage: $0 filename.c"
  exit 1
fi

filename="$1"
output="${filename%.c}"

rm -f "$output"

echo "[INFO] Compiling $filename"

if gcc "$filename" -o "$output"; then
  echo "[INFO] Compilation successfull"
  echo "[INFO] Running $output"
  ./"$output"
else
  echo "Compilation failed"
fi
