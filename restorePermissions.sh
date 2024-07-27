#!/bin/bash

#Task: Create another script that restores the permissions from the backup file.

read -p "Enter the Backup file path:" backup_file

setfacl --restore=$backup_file
echo "Permissions restored successfully"
