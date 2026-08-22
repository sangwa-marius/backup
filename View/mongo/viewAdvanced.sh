#!/usr/bin/env bash

if [[ -z "$MONGO_URL" ]]; then
    echo MONGO_URL not set
    exit 1
fi

raw_json=$(mongosh "$MONGO_URL" --json=relaxed --quiet --eval 'db.students.find().toArray()')
selected_student=$(echo "$raw_json" | jq -r  '"\(.[].name)"' | gum filter)

if [[ -z $selected_student ]]; then
    echo "No student selected"
    exit 1
fi

echo "Detailed information about $selected_student"

selected_student_info

fetch_selected_student_info(){
selected_student_info=$(mongosh "$MONGO_URL" --quiet --json=relaxed --eval "db.students.findOne({name:'${selected_student}'})" | jq -r '"
Student name : \(.name)
Student email: \(.email)
School       : \(.school)
age          : \(.age)
"')
}

gum spin \
--spinner dot \
-- bash -c 'fetch_selected_student_info'


gum style \
--border normal \
--border-foreground 40 \
--padding "1 2" \
"$selected_student_info"

