#!/bin/bash

#Here we are going to study about functions and functions are used for reusability.
#Write a function to check if the number is even or odd.
function is_loyal(){
	read -p "Enter a number: " num1
	if [[ $((num1 % 2)) -eq 0 ]];
	then 
		echo "Number is even"
	else
		echo "NUmber is odd"
	fi
}

#This is function call 
is_loyal

