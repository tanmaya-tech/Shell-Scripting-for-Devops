#!/bin/bash

user1=$1
user2=$2

# To check if 2 arguments are entered
 if [ $# -ne 2 ]; then
	 echo "Usage: $0 <user1> <user2>"
	 exit 1
 fi

#Create 2  users
sudo useradd $user1
sudo useradd $user2

echo "Users Created"
echo "$user1"
echo "$user2"

