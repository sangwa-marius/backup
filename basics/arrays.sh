#!/usr/bin/env bash

array=(3 1 2 5)
names=("Marius" "sangwa" "Ishimwe" "Rocky")
IFS=","

echo "${array[*]}"
echo "$IFS"
sorted_array=($(printf '%s \n' "${array[@]}" | sort))
filtered_names=($(printf '%s \n' "${names[@]}" | grep "s"))
echo "${sorted_array[@]}"
echo "${filtered_names[@]}"
unshift_names=("Okay" "${names[@]}");
echo "${unshift_names[0]}"
echo "$unset_names"