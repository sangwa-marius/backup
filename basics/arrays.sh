#!/bin/bash

names=("Marius" "Sangwa" "Forever" "Rocky" "Marius" "Sangwa" "Forever" "Rocky");
echo "${#names[@]}"
unset names[1]
echo "${#names[@]}"
echo "${names[1]}"
names+=("eva" "adam")
echo "${#names[@]}"
echo "${!names[@]}"
echo "${names[@]}"
length="${#names[@]}"
index=$((length-1))
echo "${names[index]}"
echo "${names[@]:2:4}"
names=("${names[@]}")

for  i in "${!names[@]}"; do
    echo "index $i  value ${names[i]}"
done

item="Rocky"
echo "${item^^}"
echo "${item,,}"

new_array=()

for i in "${names[@]}"; do
    new_array+=("${i^^}")
done


echo "${new_array[@]}"
echo "${#new_array[@]}"
echo "${#new_array[*]}"
