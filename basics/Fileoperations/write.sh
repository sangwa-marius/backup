#!/bin/bash

YELLOW='\033[1;33m'
BLUE="\033[0;34m"
NC="\033[0m"

read -sp "Enter your password: " password
echo ""
if [[ $password != "sanMariento" ]]; then
	echo "Wrong Password"
	exit
fi

printf "${BLUE}Hello Marius! Welcome to your simple data recording bash script\n${NC}"
read -p "Wanna read the data ? (y/n) " answer
if [[ $answer == "y" ]]; then
    echo "Reading data from data.txt..."
    sleep 3
    if [[ -f data.txt ]]; then
        echo "Contents of data.txt:"
        while IFS= read -r line;do
		echo "$line"
		sleep 1
	done<data.txt
    else
        echo "data.txt does not exist."
    fi
else
    echo "Okay, let's write some data to data.txt"
fi
read -p "Enter the name: " name
read -p "Enter the age: " age
read -p "Enter the city: " city
read -p "Enter the country: " country

echo "------------------------------------------" >> data.txt
echo "Date: [$(date '+%Y-%m-%d %H:%M:%S')]" >> data.txt
echo "Name: $name" >> data.txt
echo "Age: $age" >> data.txt
echo "City: $city" >> data.txt
echo "Country: $country" >> data.txt
echo "------------------------------------------" >> data.txt
echo  "" >> data.txt
printf "${YELLOW}Information saved to data.txt${NC}\n"
