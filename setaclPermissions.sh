#!/bin/bash

read -p "Enter Username:" user1
read -p "Enter Filepath:" filepath1
read -p "Enter File Permissions (eg. rw, rwx etc):" permissions

setfacl -m u:$user1:$permissions $filepath1
echo "Permissions set successfully"

