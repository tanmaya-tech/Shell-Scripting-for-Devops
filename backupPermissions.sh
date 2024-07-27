#!/bin/bash

#Task: Create a script that backs up the current permissions of files in a directory to a file.

read -p "Enter the directory path:" dir_path

getfacl -R $dir_path > permissions_backup.txt
echo "Backup of all file permissions in $dir_path created successfully"
