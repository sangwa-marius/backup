#!/usr/bin/env bash

clear

if [[ -z "$MONGO_URL" ]]; then
    echo MONGO_URL not set
    exit 1
fi

fetch_all_student_names(){
    mongosh "$MONGO_URL" --json=relaxed --quiet --eval 'db.students.find().toArray()'
}

raw_json=$(
    gum spin \
    --spinner dot \
    --title "Loading all student names" \
    -- bash -c "$(declare -f fetch_all_student_names);fetch_all_student_names"
)


selected_student=$(echo "$raw_json" | jq -r  '"\(.[].name)"' | gum filter)

if [[ -z $selected_student ]]; then
    echo "No student selected"
    exit 1
fi

fetch_selected_student_info(){
    mongosh "$MONGO_URL" --quiet --json=relaxed --eval "db.students.findOne({name:'$1'})" | jq -r '"
Student name : \(.name)
Student email: \(.email)
School       : \(.school)
age          : \(.age)
    "'
}

selected_student_info=$(
    gum spin \
    --spinner dot \
    --title "Loading details for $selected_student" \
    -- bash -c "$(declare -f fetch_selected_student_info); fetch_selected_student_info \"$selected_student\""
)

gum style \
--border normal \
--border-foreground 40 \
--padding "0 2" \
--margin "1 0" \
"$selected_student_info"

