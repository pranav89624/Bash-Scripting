#!/bin/bash

echo "========================================"
echo "    BASH WHILE LOOPS DEMONSTRATION"
echo "========================================"

# Basic While Loop
echo -e "\n1. BASIC WHILE LOOP:"
echo "--------------------"

myVar=1

echo "Counting from 1 to 10:"
while [ $myVar -le 10 ]
do
    echo "myVar is: $myVar"
    ((myVar++))
    sleep 0.1
done
echo "Basic loop completed!"

# While Loop with Different Increment Patterns
echo -e "\n2. DIFFERENT INCREMENT PATTERNS:"
echo "--------------------------------"

# Increment by 2
echo "Counting by 2s from 2 to 20:"
counter=2
while [ $counter -le 20 ]
do
    echo "Even number: $counter"
    counter=$((counter + 2))
done

# Decrement loop
echo -e "\nCountdown from 10 to 1:"
countdown=10
while [ $countdown -ge 1 ]
do
    echo "Countdown: $countdown"
    ((countdown--))
done
echo "Blast off! 🚀"

# Geometric progression
echo -e "\nPowers of 2 (up to 1000):"
power=1
while [ $power -le 1000 ]
do
    echo "2^n = $power"
    power=$((power * 2))
done

# While Loop with String Conditions
echo -e "\n3. WHILE LOOPS WITH STRING CONDITIONS:"
echo "-------------------------------------"

# Reading user input until specific condition
echo "String comparison example:"
user_input=""
while [ "$user_input" != "quit" ]
do
    echo "Enter 'quit' to exit, or any other text to continue:"
    echo "(Simulating input for demo)"
    
    # Simulate different inputs for demonstration
    case $((RANDOM % 4)) in
        0) user_input="hello" ;;
        1) user_input="world" ;;
        2) user_input="test" ;;
        3) user_input="quit" ;;
    esac
    
    echo "Simulated input: $user_input"
    
    if [ "$user_input" != "quit" ]; then
        echo "You entered: $user_input"
    else
        echo "Goodbye!"
    fi
done

# While Loop with File Processing
echo -e "\n4. FILE PROCESSING WITH WHILE LOOPS:"
echo "------------------------------------"

# Create a sample file
sample_file="sample_data.txt"
echo "Creating sample file: $sample_file"
cat > "$sample_file" << EOF
apple
banana
cherry
date
elderberry
fig
grape
EOF

echo "Reading file line by line:"
line_number=1
while IFS= read -r line
do
    echo "Line $line_number: $line"
    ((line_number++))
done < "$sample_file"

echo "Total lines processed: $((line_number - 1))"

# While Loop with Error Handling
echo -e "\n6. WHILE LOOPS WITH ERROR HANDLING:"
echo "----------------------------------"

# Function to simulate operations that might fail
simulate_operation() {
    local attempt=$1
    # Simulate success after 3 attempts
    if [ $attempt -ge 3 ]; then
        return 0  # Success
    else
        return 1  # Failure
    fi
}

echo "Retry mechanism with while loop:"
max_attempts=5
attempt=1

while [ $attempt -le $max_attempts ]
do
    echo "Attempt $attempt of $max_attempts"
    
    if simulate_operation $attempt; then
        echo "Operation succeeded on attempt $attempt!"
        break
    else
        echo "Operation failed on attempt $attempt"
        
        if [ $attempt -eq $max_attempts ]; then
            echo "Maximum attempts reached. Operation failed."
            exit 1
        fi
        
        echo "Retrying in 1 second..."
        sleep 1
        ((attempt++))
    fi
done

# Nested While Loops
echo -e "\n7. NESTED WHILE LOOPS:"
echo "---------------------"

echo "Multiplication table (1-5):"
outer=1
while [ $outer -le 5 ]
do
    inner=1
    while [ $inner -le 5 ]
    do
        result=$((outer * inner))
        printf "%2d " $result
        ((inner++))
    done
    echo  # New line after each row
    ((outer++))
done

# Clean up sample file
rm -f "$sample_file" 2>/dev/null

# Mathematical Calculations with While Loops
echo -e "\n8. MATHEMATICAL CALCULATIONS:"
echo "------------------------------"

echo "Calculating factorial of 10 using while loop:"
number=10
factorial=1
temp_num=$number

while [ $temp_num -gt 0 ]
do
    factorial=$((factorial * temp_num))
    echo "$temp_num! calculation step: $factorial"
    ((temp_num--))
done
echo "Final result: $number! = $factorial"

# Fibonacci sequence
echo -e "\nFibonacci sequence (first 10 numbers):"
a=0
b=1
count=0
max_fib=10

echo "Fibonacci sequence:"
while [ $count -lt $max_fib ]
do
    if [ $count -eq 0 ]; then
        echo -n "$a "
    elif [ $count -eq 1 ]; then
        echo -n "$b "
    else
        next=$((a + b))
        echo -n "$next "
        a=$b
        b=$next
    fi
    ((count++))
done
echo  # New line

# While Loop Best Practices
echo -e "\n9. WHILE LOOP BEST PRACTICES:"
echo "------------------------------"
echo "Always ensure the loop condition will eventually become false"
echo "Use proper variable initialization before the loop"
echo "Consider using 'break' and 'continue' for better control flow"
echo "Handle edge cases and error conditions"
echo "Use meaningful variable names for loop counters"
echo "Avoid infinite loops unless intentionally designed"
echo "Use appropriate sleep/delays for resource-intensive operations"
exit 0