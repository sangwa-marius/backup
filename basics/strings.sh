#!/usr/bin/env bash

RED="\033[0;31m"
YELLOW="\033[1;33m"
BLUE="\033[0;34"
NC="\033[0m"

string="Hello world"
string2="Bash scripting is fun"
result="$string $string2 is a powerful tool for automation and scripting tasks."

echo "${result}"

printf "${YELLOW}%i\n${NC}" "${#string}" #printing the length of a string in a red color

echo "${string/w/bash}" # replacing the first occurrence of "w" with "bash"

echo "${string//o/a}" # replacing all occurrences of "o" with "a"

echo "${string^^}" # converting to uppercase

echo "${string:0:4}" # extracting a substring from index 0 with length 4

echo "${string%ld}" # removing the shortest match of "ld" from the end



