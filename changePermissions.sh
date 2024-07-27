#!/bin/bash

read -p "Enter the directory path:" path
read -p "Enter the permissions (eg. 400, 777):" per

sudo chmod -R $per $path
echo "Permissions changed successfully for the directory: $path"
