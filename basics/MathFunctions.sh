#!/usr/bin/env bash

add(){
    local sum=$(( $1 + $2 ))
    echo $sum
}

add_any(){
    local sum=0
    for num in "$@"; do
        sum=$((sum + num))
    done
    echo $sum
}

find_max(){
    max=$1
    for number in "$@"; do
        if [[ $number -gt $max ]]; then
            max=$number
        fi
    done
    echo "The maximum number is: $max"
}


square(){
    result=$(($1**2))
    echo "$result"
}