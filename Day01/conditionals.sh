#!/bin/bash

<< disclaimer
This is just for information purpose and
for understanding.
disclaimer

#Understanding if, elif conditions
#To print name if name entered matches our value else print a message.

read -p "Enter the name1: " name1

if [[ $name1 == "Tanmaya" ]];
then
	echo "Name matches and is $name1"
elif [[ $name1 == "Vamika" ]];
then
	echo "Name matches and is $name1"
else
	echo "Name does not match"
fi
