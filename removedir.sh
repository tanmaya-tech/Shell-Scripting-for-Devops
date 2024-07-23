#!/bin/bash

#To check if 3 arguments are provided or not
if [ $# -ne 3 ]; then
        echo "Usage: $0 day 1 90"
        exit 1
fi

#To create directories

dir_name=$1
start_num=$2
end_num=$3

for ((i=start_num; i<=end_num; i++))
do
        rmdir "${dir_name}${i}"
done

echo "Directories from ${dir_name}${start_num} to ${dir_name}${end_num} have been removed!"
