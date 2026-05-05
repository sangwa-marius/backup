#!/bin/bash

YELLOW='\033[1;33m'
read -p "Wanna read the data ? (y/n) " answer
if [[ $answer == "y" ]]; then
echo "Reading data from data.txt..."
sleep 3
    if [[ -f data.txt ]]; then
        echo "Contents of data.txt:"
        cat data.txt
    else
        echo "data.txt does not exist."
    fi
else
    echo "Okay, let's write some data to data.txt"
fi
read -p "Enter your name: " name
read -p "Enter your age: " age
read -p "Enter your city: " city
read -p "Enter your country: " country

echo "------------------------------------------" >> data.txt
echo "Date: [$(date '+%Y-%m-%d %H:%M:%S')]" >> data.txt
echo "Name: $name" >> data.txt
echo "Age: $age" >> data.txt
echo "City: $city" >> data.txt
echo "Country: $country" >> data.txt
echo "------------------------------------------" >> data.txt
echo  "" >> data.txt
printf "${YELLOW}Information saved to data.txt${NC}\n"