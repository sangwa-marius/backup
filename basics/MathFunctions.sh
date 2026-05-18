#!/usr/bin/env bash

. ../colors.sh
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
    echo "$max"
}


square(){
    if [[ -z $1 ]]; then
    echo -e "${PURPLE}Usage: square ${BOLD_PURPLE}one${PURPLE} argument${NC}"
    exit 1
    fi
    result=$(($1**2))
    echo "$result"
}

square_any(){
    entries=("$@")
    if [[ "${#entries[@]}" -lt 1 ]]; then
    echo -e "${PURPLE}Usange: square_any ${BOLD_PURPLE}argument1, argument2,...argument(n)${NC}"
    exit 1
    fi
    squares=("")
    for i in "${!entries[@]}"; do
    squares+=("$((${entries[i]}**2))")
    done

    for i in "${!squares[@]}"; do
    echo "${squares[i]}"
    done

}

