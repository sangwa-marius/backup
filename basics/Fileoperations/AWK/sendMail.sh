#!/usr/bin/env bash

source ~/.colors.sh
toilet -cf slant -F metal "Email sender"

read -p "What is your name? " name
read -p "What is your email? " sender_email
read -p "What is your recipient email? " receiver_email
read -p "Thank you $name. Now Enter the subject: " subject
read -p "Enter the message: " message

email_payload="To: $receiver_email
From: $sender_email
Subject: $subject

Hello ${receiver_email%@gmail.com}! 
${name} has sent you a message:

$message"

gum spin \
--spinner moon \
--title="Sending email..." \
--title.foreground 55 \
-- bash -c "echo '$email_payload' | msmtp '$receiver_email'"


if [ $? -eq 0 ]; then
    echo "Sent successfully!"
else
    echo "Error: Failed to send email. Check your msmtp logs."
fi

choice=$(gum confirm "Wanna attach some file?" && echo "yes" || echo "No")
if [[ $choice != "yes" ]]; then
echo -e "${BOLD_YELLOW}Thank you"
exit 
fi

file_path=$(
    gum input \
    --placeholder="Enter file path" \
    )
gum spin \
--spinner moon \
--title="Sending file..." \
--title.foreground 99 \
-- bash -c "mpack -s 'File' -a '$file_path' '$receiver_email' "

