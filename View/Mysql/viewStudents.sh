#!/usr/bin/env bash

echo ""

gum spin --spinner "dot"  --title "Fetching data" --title.foreground 40 --spinner.foreground 40 -- sleep 3
echo ""
mysql -u "$Db_user" -p"$Db_password" "$Db_name" -B -e "SELECT * FROM students;" | tr "\t" "," | gum table --selected.foreground 99 --header.foreground 40