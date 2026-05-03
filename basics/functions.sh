#!/bin/bash

# Defining a function using function keyword
function greet() {
    echo "Hello, $1! you are $2 years old"
}
greet "Marius" "12"

# Standard function definition
my_function(){
    echo "This i s a simple function"
}
my_function

add(){
   local sum=$(( $1 + $2 ))
    echo $sum
}
result=$(add 5 10)
echo "The sum is: $result"

add_any(){
    local sum=0
    for num in "$@"; do 
        sum=$((sum + num))
    done
    echo $sum
}

add_any 1 2 3 4 5 6

