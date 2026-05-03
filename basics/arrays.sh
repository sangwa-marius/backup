#!/bin/bash

names=("Marius" "Sangwa" "Forever" "Rocky" "Marius" "Sangwa" "Forever" "Rocky");
old_ifs=$IFS
IFS=" "
echo "names: ${names[@]}"
echo "names
echo "indices of names : ${!names[*]}"

for i in "${names[@]}"; do
    echo "name: $i"
done

for i in "${names[*]}"; do
    echo "name: $i"
done
