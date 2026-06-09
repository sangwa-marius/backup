#!/usr/bin/env bash

toilet -cf slant -F metal "Email sender"

read -p "What is your name? " name
read -p "What is your email? " sender_email
read -p "What is your recipient email? " receiver_email
read -p "Thank you $name. Now Enter the subject: " subject
read -p "Enter the message: " message

if echo -e "Subject: $subject\n\n Hello ${receiver_email%@gmail.com}! ${name} has sent you a message: \n$message" | msmtp $receiver_email; then
echo "Email sent successfully"
else
echo 
echo "Failed to send the email"
fi
