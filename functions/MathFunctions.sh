#!/usr/bin/env bash

source ../colors.sh

letter_pattern="[^0-9]"
add(){
    
    if [[ -z $1 || -z $2 ]]; then
        echo -e "${PURPLE}Usage: ${BOLD_PURPLE}add arg_1 arg_2${NC}"
        return
        
    fi
    
    if [[ $1 =~ $letter_pattern || $2 =~ $letter_pattern ]]; then
        echo -e "${BOLD_RED}Arguments should be intergers ${NC}"
        return
    fi
    
    local sum=$(( $1 + $2 ))
    echo $sum
}

add_any(){
    if [[ ! $@ ]]; then
        echo -e "${PURPLE}Usage: ${BOLD_PURPLE}add_any arg_1 arg_2,... arg_n ${NC}"
        return
    fi
    
    for number in $@; do
        if [[ $number =~ $letter_pattern ]]; then
            echo -e "${BOLD_RED}All arguments should be numbers${NC}"
            return
        fi
    done
    
    local sum=0
    for num in "$@"; do
        sum=$((sum + num))
    done
    echo $sum
}


find_max(){
    
    if [[ ! $@ ]]; then
        echo -e "${PURPLE}Usage: ${BOLD_PURPLE}add_any arg_1 arg_2,... arg_n ${NC}"
        return
    fi
    
    for number in $@; do
        if [[ $number =~ $letter_pattern ]]; then
            echo -e "${BOLD_RED}All arguments should be numbers${NC}"
            exit
        fi
    done
    
    local max=$1
    
    for num in "$@"; do
        if [[ $num -gt $max ]]; then
            max=$num
        fi
    done
    echo "$max"
}


square(){
    if [[ -z $1 ]]; then
        echo -e "${PURPLE}Usage:${BOLD_PURPLE}sqaure arg${NC}"
        return
    fi
    
    if [[ $1 =~ $letter_pattern ]]; then
        echo -e "${BOLD_RED}Argument should be a number${NC}"
        return
    fi
    
    local result=$(($1**2))
    echo "$result"
}

square_any(){
    if [[ ! $@ ]]; then
        echo -e "${PURPLE}Usage: ${BOLD_PURPLE}add_any arg_1 arg_2,... arg_n ${NC}"
        return
    fi
    
    for number in $@; do
        if [[ $number =~ $letter_pattern ]]; then
            echo -e "${BOLD_RED}All arguments should be numbers${NC}"
            return
        fi
    done
    
    local entries=("$@")
    
    if [[ "${#entries[@]}" -lt 1 ]]; then
        echo -e "${PURPLE}Usange: square_any ${BOLD_PURPLE}argument1, argument2,...argument(n)${NC}"
        return
    fi
    
    local squares=("")
    
    for i in "${!entries[@]}"; do
        squares+=("$((${entries[i]}**2))")
    done
    
    for i in "${!squares[@]}"; do
        echo "${squares[i]}"
    done
    
}

expon(){
    if [[ -z $1 || -z $2 ]];then
        echo -e "${PURPLE}Usage: expon ${BOLD_PURPLE} arg1 arg2 ${NC}"
        return
    fi
    
    for number in $@; do
        if [[ $number =~ $letter_pattern ]]; then
            echo -e "${BOLD_RED}All arguments should be numbers${NC}"
            return
        fi
    done
    
    local result=$(($1**$2))
    echo $result
}


