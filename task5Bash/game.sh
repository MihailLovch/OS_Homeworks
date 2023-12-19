#!/bin/bash

hit_count=0
miss_count=0
all_numbers=()
RED='\e[31m' 
GREEN='\e[32m' 
RESET='\e[0m' 

step=1

while true; do 
    secret_number=$((RANDOM % 10)) 

    echo "Step: $step" 
    read -p "Please enter number from 0 to 9 (q - quit): " user_input  

    if [ "$user_input" == "q" ]; then 
        break
    fi

    if [[ "$user_input" =~ ^[0-9]$ ]]; then 
        user_number=$user_input

        if [ "$user_number" -eq "$secret_number" ]; then
            echo "Hit! My number: $secret_number"
            ((hit_count++)) 
            all_numbers+=("${GREEN}$secret_number${RESET}")
        else
            echo "Miss! My number: $secret_number" 
            ((miss_count++)) 
            all_numbers+=("${RED}$secret_number${RESET}") 
        fi
    else
        echo "Error: Invalid input. Please enter a single digit number or 'q' to quit."
        continue
    fi

    hit_percentage=$((hit_count * 100 / step))
    miss_percentage=$((miss_count * 100 / step))

    echo "Hit: $hit_percentage% Miss: $miss_percentage%"
    len=${#all_numbers[@]}
    start_index=$((len-10))
    if [ $start_index -lt 0 ]; then
        start_index=0
    fi
    echo -e "Numbers: ${all_numbers[@]:$start_index:10}"
    ((step++))
done
