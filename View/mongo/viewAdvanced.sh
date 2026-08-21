#!/usr/bin/env bash

if [[ -z "$MONGO_URL" ]]; then
echo MONGO_URL not set
fi

selected_student=$(raw_json=$(mongosh "$MONGO_URL" --json=relaxed --quiet --eval 'db.students.find().toArray()')
echo "$raw_json" | jq -r  '"\(.[].name)"' | gum filter)


echo "Detailed information about $selected_student"

selected_student_info=$(mongosh "$MONGO_URL" --quiet --json=relaxed --eval "db.students.findOne({name:'${selected_student}'})" | jq -r '"
Student name : \(.name)
Student email: \(.email)
School       : \(.school)
age          : \(.age)
"')

gum style \
--border normal \
--border-foreground 40 \
--padding "1 2" \
"$selected_student_info"

