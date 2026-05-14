#!/bin/bash

# This script demonstrates the use of the 'declare' command in Bash to create and display various types of variables.

name="Sangwa Marius"
declare -p name

declare -i age=25
declare -p age
age2=44; #Defaults to a string variable
declare -p age2


declare -a cities=("New York" "Paris" "Tokyo")
declare -p cities

declare -A user_info=(
    ["name"]="Sangwa Marius"
    ["age"]=25
    ["city"]="New York"
)

declare -p user_info