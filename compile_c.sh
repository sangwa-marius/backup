#!/bin/bash

set -eu

if [ -z "${1:-}" ]; then
  echo "Usage: $0 filename.c"
  exit 1
fi

mkdir -p bin
filename="$1"
output="${filename%.c}"

rm -f "bin/$output"

echo "[INFO] Compiling $filename"

if gcc "$filename" -o "bin/$output"; then
  echo "[INFO] Compilation successfull"
  echo "[INFO] Running $output"
  ./bin/$output
else
  echo "Compilation failed"
fi
