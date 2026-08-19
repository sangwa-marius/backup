#!/usr/bin/env bash

declare -A student_info
columns=(
    "Student_name"
    "Student_email"
    "Student_current_school"
    "Student_age"
)

for column in "${columns[@]}"; do
    read -p "Enter $column: "  value
    student_info["$column"]=$value
done
mysql -u "$Db_user" -p"$Db_password" "$Db_name" -e "
INSERT INTO students(
Student_name,
Student_email,
Student_current_school,
Student_age
)

VALUES(
'${student_info[Student_name]}',
'${student_info[Student_email]}',
'${student_info[Student_current_school]}',
${student_info[Student_age]}
);"

if [[ $? == 0 ]]; then
    echo "Student info saved successfully in the database"
else
    echo "Failed to save the student info to the database"
fi
