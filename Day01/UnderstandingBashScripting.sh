#!/bin/bash

#This is a comment. Anything written with "#" in start is known as a comment.

#Below, "echo" is the keyword used to print/display the anything written within ""
echo "Hi, Welcome Tech Enthusiasts! This is a script which tells you about the basics of Shell Scripting" 

#Let's declare a variable with the name "num1 and num2" and then print their sum .
num1=5
num2=10
sum=$((num1 + num2))
echo "The value of sum of $num1 and $num2  is $sum"

#Now, lets experiment with built-in variables

echo "Current logged in user is: $USER"
echo "Home Directory is: $HOME"

#Wildcards in Bash helps to recognize some kind of pattern

echo "Listing all files in current directory:"
ls *.txt


