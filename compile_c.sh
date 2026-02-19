#!/bin/bash

echo "Script name: $0"
echo "program to run: $1"

echo "Building $1..."
gcc $1 -o main.c

echo "Running the program..."
./main.c
