#!/bin/bash

#Here we will be understanding FOR LOOPS

#Here num is a variable it can be anything else as well like i,j abc ..so on anything as per your choice. This loop tells us that there is a variable named num whose value goes from 1 to 5.

#Program to make 5 folders at once.
<< comment
1 is argument 1 which is folder name 
2 is the start range
3 is the end range

comment

for (( num=$2 ; num<=$3 ; num++ ))
do
	mkdir "$1$num"
done

