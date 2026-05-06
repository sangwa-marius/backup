#!/bin/bash

# For loop
numbers=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)

for key in "${!numbers[@]}"; do
    if (( numbers[key]%2 == 0 )); then
        echo "number ${numbers[key]} is even"
    else
        echo "number ${numbers[key]} is odd"
    fi
done

i=1
# while (( i <= 10)); do
#     echo "number $i"
#     ((i++))
# done



until (( i > 8)); do
    echo "number $i"
    ((i++))
done

file="./arrays.sh"
IFS=$'\n' read -d '' -r -a file < "$file"

for line in "${file[@]}"; do
    echo "$line"
done



