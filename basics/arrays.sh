#!/usr/bin/env bash

array=(3 1 2 5)

names=("Marius" "sangwa" "Ishimwe" "Rocky")

images=("photo.jpg" "marius.png" "coding.png")

#replace
replace_images=("${images[@]/.jpg/.png}")
echo "${replace_images[0]}"

echo "${array[*]}"

#sort
sorted_array=($(printf '%s \n' "${array[@]}" | sort))

#fileter
filtered_names=($(printf '%s \n' "${names[@]}" | grep "s"))

echo "${sorted_array[@]}"

echo "${filtered_names[@]}"

#unshift
unshift_names=("Okay" "${names[@]}");

echo "${unshift_names[0]}"

upper_names=("")

for name in "${names[@]}"; do
    upper_names+=("${name^^}")
done
echo "${upper_names[2]}"
