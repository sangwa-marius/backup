#!/bin/bash

names=("Marius" "Sangwa" "Forever" "Rocky" "Marius" "Sangwa" "Forever" "Rocky")
old_ifs=$IFS
IFS="_"
echo "names: ${names[@]}"
echo "names in string form: ${names[*]}"
