#!/bin/bash

read -p "Enter username: " username #This is another way to use read command where we can specify a Promot using -p.
echo "You entered $username"

sudo useradd -m $username #Thus is the command to add a new user. Once done, execute this file, run it and verify in /etc/passwd to see if user created or not.
echo "New User $username is added"

echo "The characters are $0 $1" #These are arguments where $0 is createuser.sh whereaes $1 will be any argument entered by the user on CL while executing the script.
