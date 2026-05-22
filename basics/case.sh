#!/usr/bin/env bash

read -p "Enter your age: " age

case 1 in
$((age<13)))
echo "You are a child"
;;

$((age >=13 && age <19)))
echo "You are a teen"
;;

*)
echo "You are an adult"
;;

esac