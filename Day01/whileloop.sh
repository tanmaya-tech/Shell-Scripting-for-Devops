#!/bin/bash

#Here we are going to study about while loop
<< Comment 
# To Print word "lol" 6 times
num=0
while [[ $num -le 5 ]]
do
	echo "Lol"
	num=$num+1
done
Comment

#To print number if it is even and less than or equal to 10

read -p "Enter a number: " num1

while [[ $((num1 % 2)) -eq 0 && $num1 -le 10 ]] #Showing use of logical operator in while loops
do
	echo "Number is even less than equal to 10 and is $num1"
	num1=$((num1+1))
done
