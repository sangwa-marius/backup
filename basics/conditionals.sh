#!/bin/bash

while true; do
    read -p "Hello , I 'm Your age checker. Who are you? " name
    read -p "Hello $name, How old are you?  "  age
    if [[ $age -lt 18 ]]; then
        remaining=$((18-age))
        echo "Ooh! sorry $name you will be allowed to vote in next $remaining years"
    else
        echo "Congz $name, you can now vote"
    fi
    
    read -p "Do you wanna check for more people?[Y/N] " choice
    if [[  $choice != "Y" ]]; then
        break
    fi
    
done