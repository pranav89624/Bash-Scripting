#!/bin/bash

# Basic If-Else Statement
echo -e "\n1. BASIC IF-ELSE STATEMENT:"
echo "----------------------------"

# Simple number comparison
number=10

if [ $number -eq 10 ]; then
    echo "The number is equal to 10"
else
    echo "The number is not equal to 10"
fi

# If-Elif-Else Statement
echo -e "\n2. IF-ELIF-ELSE STATEMENT:"
echo "----------------------------"

score=85

if [ $score -ge 90 ]; then
    echo "Grade: A (Excellent!)"
elif [ $score -ge 80 ]; then
    echo "Grade: B (Good!)"
elif [ $score -ge 70 ]; then
    echo "Grade: C (Average)"
elif [ $score -ge 60 ]; then
    echo "Grade: D (Below Average)"
else
    echo "Grade: F (Fail)"
fi

# Numeric Comparison Operators
echo -e "\n3. NUMERIC COMPARISON OPERATORS:"
echo "--------------------------------"

num1=20
num2=15

echo "num1 = $num1, num2 = $num2"

# -eq : Equal to
if [ $num1 -eq $num2 ]; then
    echo "num1 is equal to num2 (-eq)"
else
    echo "num1 is NOT equal to num2 (-eq)"
fi

# -ne : Not equal to
if [ $num1 -ne $num2 ]; then
    echo "num1 is not equal to num2 (-ne)"
else
    echo "num1 is equal to num2 (-ne)"
fi

# -gt : Greater than
if [ $num1 -gt $num2 ]; then
    echo "num1 is greater than num2 (-gt)"
else
    echo "num1 is NOT greater than num2 (-gt)"
fi

# -ge : Greater than or equal to
if [ $num1 -ge $num2 ]; then
    echo "num1 is greater than or equal to num2 (-ge)"
else
    echo "num1 is NOT greater than or equal to num2 (-ge)"
fi

# -lt : Less than
if [ $num1 -lt $num2 ]; then
    echo "num1 is less than num2 (-lt)"
else
    echo "num1 is NOT less than num2 (-lt)"
fi

# -le : Less than or equal to
if [ $num1 -le $num2 ]; then
    echo "num1 is less than or equal to num2 (-le)"
else
    echo "num1 is NOT less than or equal to num2 (-le)"
fi

# String Comparison Operators
echo -e "\n4. STRING COMPARISON OPERATORS:"
echo "-------------------------------"

str1="Hello"
str2="World"
str3="Hello"

echo "str1 = '$str1', str2 = '$str2', str3 = '$str3'"

# = or == : String equality
if [ "$str1" = "$str2" ]; then
    echo "str1 equals str2"
else
    echo "str1 does NOT equal str2"
fi

if [ "$str1" = "$str3" ]; then
    echo "str1 equals str3"
else
    echo "str1 does NOT equal str3"
fi

# != : String inequality
if [ "$str1" != "$str2" ]; then
    echo "str1 is not equal to str2 (!=)"
else
    echo "str1 is equal to str2 (!=)"
fi

# < : String comparison (lexicographic order)
# Note: Use [[ ]] for string comparison with < and >
if [[ "$str1" < "$str2" ]]; then
    echo "str1 comes before str2 lexicographically"
else
    echo "str1 does NOT come before str2 lexicographically"
fi

# > : String comparison (lexicographic order)
if [[ "$str1" > "$str2" ]]; then
    echo "str1 comes after str2 lexicographically"
else
    echo "str1 does NOT come after str2 lexicographically"
fi

# File Test Operators
echo -e "\n5. FILE TEST OPERATORS:"
echo "-----------------------"

# Create a test file for demonstration
test_file="test_file.txt"
echo "Creating test file: $test_file"
echo "This is a test file" > $test_file

# -f : Check if file exists and is a regular file
if [ -f "$test_file" ]; then
    echo "File $test_file exists and is a regular file (-f)"
else
    echo "File $test_file does not exist or is not a regular file (-f)"
fi

# -d : Check if directory exists
if [ -d "." ]; then
    echo "Current directory exists (-d)"
else
    echo "Current directory does not exist (-d)"
fi

# -e : Check if file or directory exists
if [ -e "$test_file" ]; then
    echo "File $test_file exists (-e)"
else
    echo "File $test_file does not exist (-e)"
fi

# -r : Check if file is readable
if [ -r "$test_file" ]; then
    echo "File $test_file is readable (-r)"
else
    echo "File $test_file is not readable (-r)"
fi

# -w : Check if file is writable
if [ -w "$test_file" ]; then
    echo "File $test_file is writable (-w)"
else
    echo "File $test_file is not writable (-w)"
fi

# -x : Check if file is executable
if [ -x "$test_file" ]; then
    echo "File $test_file is executable (-x)"
else
    echo "File $test_file is not executable (-x)"
fi

# -s : Check if file exists and has size greater than zero
if [ -s "$test_file" ]; then
    echo "File $test_file exists and is not empty (-s)"
else
    echo "File $test_file does not exist or is empty (-s)"
fi

# String Test Operators
echo -e "\n6. STRING TEST OPERATORS:"
echo "-------------------------"

empty_string=""
non_empty_string="Hello World"

# -z : Check if string is empty (zero length)
if [ -z "$empty_string" ]; then
    echo "The empty_string is empty (-z)"
else
    echo "The empty_string is not empty (-z)"
fi

if [ -z "$non_empty_string" ]; then
    echo "The non_empty_string is empty (-z)"
else
    echo "The non_empty_string is not empty (-z)"
fi

# -n : Check if string is not empty (non-zero length)
if [ -n "$empty_string" ]; then
    echo "The empty_string is not empty (-n)"
else
    echo "The empty_string is empty (-n)"
fi

if [ -n "$non_empty_string" ]; then
    echo "The non_empty_string is not empty (-n)"
else
    echo "The non_empty_string is empty (-n)"
fi

# Logical Operators
echo -e "\n7. LOGICAL OPERATORS:"
echo "---------------------"

age=25
name="John"

# && : Logical AND
if [ $age -ge 18 ] && [ -n "$name" ]; then
    echo "Person is an adult AND has a name (&&)"
else
    echo "Either person is not an adult OR has no name (&&)"
fi

# || : Logical OR
if [ $age -lt 18 ] || [ $age -gt 65 ]; then
    echo "Person is either a minor OR a senior citizen (||)"
else
    echo "Person is neither a minor NOR a senior citizen (||)"
fi

# ! : Logical NOT
if [ ! -f "nonexistent_file.txt" ]; then
    echo "File nonexistent_file.txt does NOT exist (!)"
else
    echo "File nonexistent_file.txt exists (!)"
fi

# Combining Multiple Conditions
echo -e "\n8. COMBINING MULTIPLE CONDITIONS:"
echo "---------------------------------"

username="admin"
password="secret123"
user_age=30

# Complex condition with multiple operators
if [ "$username" = "admin" ] && [ "$password" = "secret123" ] && [ $user_age -ge 18 ]; then
    echo "Access granted: Valid credentials and user is an adult"
elif [ "$username" = "admin" ] && [ "$password" = "secret123" ]; then
    echo "Access partially granted: Valid credentials but user is a minor"
elif [ "$username" = "admin" ] || [ "$password" = "secret123" ]; then
    echo "Access denied: Either username or password is incorrect"
else
    echo "Access denied: Invalid credentials"
fi

# Nested If Statements
echo -e "\n9. NESTED IF STATEMENTS:"
echo "------------------------"

temperature=75
weather="sunny"

if [ $temperature -gt 70 ]; then
    echo "It's warm outside!"
    if [ "$weather" = "sunny" ]; then
        echo "Perfect day for outdoor activities!"
    else
        echo "Might want to check for rain despite the warmth."
    fi
else
    echo "It's cool outside."
    if [ $temperature -lt 32 ]; then
        echo "It's freezing! Bundle up!"
    else
        echo "A light jacket should be fine."
    fi
fi

# Case Statement (Alternative to multiple if-elif)
echo -e "\n10. CASE STATEMENT (Alternative to if-elif):"
echo "--------------------------------------------"

day="Monday"

case $day in
    "Monday")
        echo "Start of the work week!"
        ;;
    "Tuesday"|"Wednesday"|"Thursday")
        echo "Midweek days"
        ;;
    "Friday")
        echo "TGIF! Weekend is near!"
        ;;
    "Saturday"|"Sunday")
        echo "Weekend! Time to relax!"
        ;;
    *)
        echo "Invalid day"
        ;;
esac

# Arithmetic Comparisons using (( ))
echo -e "\n11. ARITHMETIC COMPARISONS USING (( )):"
echo "---------------------------------------"

x=10
y=20

# Using (( )) for arithmetic comparisons (more intuitive syntax)
if (( x > 5 )); then
    echo "x is greater than 5 (using (( )))"
fi

if (( x + y == 30 )); then
    echo "x + y equals 30 (using (( )))"
fi

if (( x < y )); then
    echo "x is less than y (using (( ))"
fi

# Clean up test file
echo -e "\n12. CLEANUP:"
echo "------------"
if [ -f "$test_file" ]; then
    rm "$test_file"
    echo "Test file removed successfully"
fi

echo -e "\n========================================"
echo "    END OF IF-ELSE CONDITIONALS DEMO"
echo "========================================"
