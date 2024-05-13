#!/bin/bash
# This is a file for Basics of Shell Scripting where we are learning about variables in scripting.
<< comment
This is a multiline comment
for understanding purpose.
comment

name="Tanmaya" #Here this name is a variable. Variables are non-typed in Shell scripting thus here "name" itself understand that type is string.

echo "Name is $name" #Echo is the command in scripting for printing anything and $ is used to bring out a value that is present in a variable.

echo "Date is $(date)" #To print the date of system and not here how we are printing the date as to run a command the syntax to print it directly is $(command)"

echo "Enter name:" 
read name #This takes input as name from user
echo "The name is $name"
