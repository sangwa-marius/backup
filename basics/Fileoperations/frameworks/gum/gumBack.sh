#!/usr/bin/env bash
clear
source ../../../../colors.sh
source ../../../../functions/backUpFunctions.sh

gum style \
--foreground 50 \
--border-foreground 40 \
--border double \
--width 50 \
--margin "2 20" \
--padding "1" \
--bold \
--align center \
"GUMBACK" \
"A user friendly tool for directory backups"

choice=$(
    gum choose "1. Backup" "2. Restore" \
    --cursor.foreground 50 \
    --header.foreground 40 \
    --header "You wanna"
)

if [[ $choice == "1. Backup" ]]; then
    gumBack
else
  gumRestore
fi