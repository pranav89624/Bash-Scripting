#!/bin/bash

myName="Pranav Verma"
myAge="20"

# Double quotes prints the value of the variables when refrencing them.
echo "Hello My name is $myName."
echo "I'm $myAge years old."

# Single quotes prints the variable name itself not the value of it.
echo 'Hello My name is $myName.'

# We can save the output of the other command in variables like below.
# It allows to run a sub shell process and capture the output of that process.
currentTime=$(date)

echo "The Current system time and date are : $currentTime"
