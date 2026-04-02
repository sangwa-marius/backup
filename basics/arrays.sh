

# arr=("apple" "banana" "cherry")
# echo ${arr[0]}
# arr[0]="grape"
# arr+=("orange")
# unset arr[1]
# echo ${arr[0]}
# echo ${arr[1]}
# echo ${arr[2]}
# echo ${arr[3]}
# echo ${arr[1]}

# # all elements
# echo " All elements: ${arr[@]}"
# # all elements as a single string
# echo " All elements as a single string: ${arr[*]}"

# #array length
# echo " Array length: ${#arr[@]}"

# #length of a specific element
# echo " Length of element at index 0: ${#arr[0]}"

arr2=(1 2 3 4 5)
echo ${arr2[@]}

for i in "${!arr2[@]}"; do
    echo "Index: $i, Value: ${arr2[i]}"
done

