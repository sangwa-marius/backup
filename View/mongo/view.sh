#!/usr/bin/env bash

if [[ -z $MONGO_URL ]]; then
echo MONGO_URL not set
exit
fi

raw_json=$(mongosh "$MONGO_URL" --json=canonical --quiet --eval "db.students.find().toArray()")

if [[ -z "$raw_json" || "$raw_json" == null ]]; then
echo "User not found"
exit
fi

colored_json=$(echo "$raw_json" | jq -C '.')

gum style \
    --border rounded \
    --border-foreground 40 \
    --padding "1 2" \
    "$colored_json"
