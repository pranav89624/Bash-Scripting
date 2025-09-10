#!/bin/bash

echo "========================================"
echo "    BASH EXIT CODES & ERROR HANDLING"
echo "========================================"

# Introduction to Exit Codes
echo -e "\n1. INTRODUCTION TO EXIT CODES:"
echo "------------------------------"
echo "Exit codes are numeric values (0-255) that indicate the success or failure of a command or script."
echo "0 = Success, 1-255 = Various types of errors"
echo "Exit codes can be accessed using \$? variable immediately after command execution"

# Basic Exit Code Examples
echo -e "\n2. BASIC EXIT CODE EXAMPLES:"
echo "----------------------------"

# Successful command
echo "Running: ls > /dev/null"
ls > /dev/null
echo "Exit code of 'ls' command: $?"

# Failed command
echo "Running: ls /nonexistent_directory 2>/dev/null"
ls /nonexistent_directory 2>/dev/null
echo "Exit code of failed 'ls' command: $?"

# Command that always succeeds
echo "Running: true"
true
echo "Exit code of 'true' command: $?"

# Command that always fails
echo "Running: false"
false
echo "Exit code of 'false' command: $?"

# Using Exit Codes in Conditional Statements
echo -e "\n3. USING EXIT CODES IN CONDITIONALS:"
echo "------------------------------------"

# Method 1: Check exit code directly
echo "Method 1: Checking \$? directly"
mkdir test_directory 2>/dev/null
if [ $? -eq 0 ]; then
    echo "Directory created successfully"
else
    echo "Failed to create directory (it might already exist)"
fi

# Method 2: Use command directly in if statement
echo -e "\nMethod 2: Using command directly in if statement"
if ls test_directory > /dev/null 2>&1; then
    echo "Directory exists and is accessible"
else
    echo "Directory does not exist or is not accessible"
fi

# Standard Exit Codes
echo -e "\n4. STANDARD EXIT CODES:"
echo "-----------------------"
echo "0   - Success"
echo "1   - General errors (catchall for general errors)"
echo "2   - Misuse of shell builtins"
echo "126 - Command invoked cannot execute"
echo "127 - Command not found"
echo "128 - Invalid argument to exit"
echo "130 - Script terminated by Control-C (SIGINT)"
echo "255 - Exit status out of range"

# Function to demonstrate different exit codes
demonstrate_exit_code() {
    local code=$1
    local description=$2
    echo "Demonstrating exit code $code: $description"
    
    # Create a temporary script that exits with the specified code
    echo "exit $code" > temp_script.sh
    chmod +x temp_script.sh
    
    # Run the script and capture its exit code
    ./temp_script.sh
    echo "Captured exit code: $?"
    
    # Clean up
    rm -f temp_script.sh
}

echo -e "\n5. DEMONSTRATING VARIOUS EXIT CODES:"
echo "------------------------------------"
demonstrate_exit_code 0 "Success"
demonstrate_exit_code 1 "General error"
demonstrate_exit_code 2 "Misuse of shell builtins"
demonstrate_exit_code 42 "Custom error code"

# Custom Exit Codes in Functions
echo -e "\n6. CUSTOM EXIT CODES IN FUNCTIONS:"
echo "----------------------------------"

# Function that returns different exit codes based on input
check_number() {
    local num=$1
    
    # Check if argument is provided
    if [ -z "$num" ]; then
        echo "Error: No number provided"
        return 1  # General error
    fi
    
    # Check if it's a valid number
    if ! [[ "$num" =~ ^[0-9]+$ ]]; then
        echo "Error: '$num' is not a valid number"
        return 2  # Invalid input
    fi
    
    # Check number ranges
    if [ "$num" -lt 0 ]; then
        echo "Error: Number is negative"
        return 3  # Negative number error
    elif [ "$num" -eq 0 ]; then
        echo "Number is zero"
        return 4  # Zero value
    elif [ "$num" -lt 10 ]; then
        echo "Single digit number: $num"
        return 0  # Success
    elif [ "$num" -lt 100 ]; then
        echo "Double digit number: $num"
        return 0  # Success
    else
        echo "Large number: $num"
        return 5  # Large number warning
    fi
}

# Test the function with different inputs
echo "Testing check_number function:"

test_cases=("" "abc" "-5" "0" "7" "42" "150")

for test_case in "${test_cases[@]}"; do
    echo -e "\nTesting with: '$test_case'"
    check_number "$test_case"
    exit_code=$?
    echo "Function returned exit code: $exit_code"
done

# Error Handling Patterns
echo -e "\n7. ERROR HANDLING PATTERNS:"
echo "---------------------------"

# Pattern 1: Stop on first error (set -e)
echo "Pattern 1: Stop on first error using 'set -e'"
echo "Note: This will be demonstrated in a subshell to prevent script termination"

(
    set -e  # Exit immediately if a command exits with a non-zero status
    echo "This command will succeed"
    true
    echo "This command will also succeed"
    echo "The next command will fail and stop the script"
    false
    echo "This line will never be executed"
) || echo "Subshell exited due to error (exit code: $?)"

# Pattern 2: Continue on error but track failures
echo -e "\nPattern 2: Continue on error but track failures"
error_count=0

echo "Command 1: ls (should succeed)"
if ! ls > /dev/null 2>&1; then
    echo "Command 1 failed"
    ((error_count++))
fi

echo "Command 2: ls /nonexistent (should fail)"
if ! ls /nonexistent > /dev/null 2>&1; then
    echo "Command 2 failed"
    ((error_count++))
fi

echo "Command 3: echo hello (should succeed)"
if ! echo "hello" > /dev/null 2>&1; then
    echo "Command 3 failed"
    ((error_count++))
fi

echo "Total errors encountered: $error_count"

# Pattern 3: Trap errors and cleanup
echo -e "\nPattern 3: Using trap for error handling and cleanup"

# Function to be called on error
error_handler() {
    local line_number=$1
    echo "Error occurred at line $line_number"
    echo "Performing cleanup..."
    # Cleanup code would go here
    rm -f temp_file_*.txt 2>/dev/null
    echo "Cleanup completed"
}

# Set trap to call error_handler on ERR signal
trap 'error_handler $LINENO' ERR

# Create some temporary files for demonstration
echo "Creating temporary files..."
touch temp_file_1.txt temp_file_2.txt

# This will trigger the error handler
echo "About to execute a command that will fail..."
set -e  # Enable exit on error for this demonstration
# ls /definitely_nonexistent_directory 2>/dev/null || true  # Commented out to prevent actual error

# Reset error handling
set +e
trap - ERR

echo "Error handling demonstration completed"

# File Operation Exit Codes
echo -e "\n8. FILE OPERATION EXIT CODES:"
echo "-----------------------------"

# Function to check file operations and their exit codes
check_file_operation() {
    local operation=$1
    local file=$2
    
    case $operation in
        "create")
            echo "Creating file: $file"
            touch "$file"
            ;;
        "read")
            echo "Reading file: $file"
            cat "$file" > /dev/null
            ;;
        "write")
            echo "Writing to file: $file"
            echo "test content" > "$file"
            ;;
        "delete")
            echo "Deleting file: $file"
            rm "$file"
            ;;
        *)
            echo "Unknown operation: $operation"
            return 1
            ;;
    esac
    
    local exit_code=$?
    echo "Operation '$operation' on '$file' returned exit code: $exit_code"
    return $exit_code
}

# Test file operations
test_file="test_operation_file.txt"

echo "Testing file operations:"
check_file_operation "create" "$test_file"
check_file_operation "write" "$test_file"
check_file_operation "read" "$test_file"
check_file_operation "delete" "$test_file"
check_file_operation "read" "$test_file"  # This should fail

# Network/Command Exit Codes
echo -e "\n9. COMMON COMMAND EXIT CODES:"
echo "-----------------------------"

# Test various commands and their exit codes
commands=("echo 'Hello World'" "grep 'pattern' /dev/null" "ping -c 1 localhost" "which bash" "which nonexistent_command")

for cmd in "${commands[@]}"; do
    echo -e "\nExecuting: $cmd"
    eval "$cmd" > /dev/null 2>&1
    exit_code=$?
    echo "Exit code: $exit_code"
    
    # Interpret common exit codes
    case $exit_code in
        0)
            echo "Status: Success"
            ;;
        1)
            echo "Status: General error or command failed"
            ;;
        127)
            echo "Status: Command not found"
            ;;
        *)
            echo "Status: Other error (code $exit_code)"
            ;;
    esac
done

# Best Practices for Exit Codes
echo -e "\n10. BEST PRACTICES FOR EXIT CODES:"
echo "----------------------------------"

# Function demonstrating good exit code practices
validate_and_process() {
    local input_file=$1
    local output_file=$2
    
    # Validate input parameters
    if [ $# -ne 2 ]; then
        echo "Error: Function requires exactly 2 arguments" >&2
        return 1  # Invalid usage
    fi
    
    # Check if input file exists
    if [ ! -f "$input_file" ]; then
        echo "Error: Input file '$input_file' does not exist" >&2
        return 2  # Input file not found
    fi
    
    # Check if input file is readable
    if [ ! -r "$input_file" ]; then
        echo "Error: Input file '$input_file' is not readable" >&2
        return 3  # Permission denied
    fi
    
    # Check if output directory exists
    local output_dir=$(dirname "$output_file")
    if [ ! -d "$output_dir" ]; then
        echo "Error: Output directory '$output_dir' does not exist" >&2
        return 4  # Output directory not found
    fi
    
    # Process the file (copy in this example)
    if cp "$input_file" "$output_file"; then
        echo "Successfully processed '$input_file' to '$output_file'"
        return 0  # Success
    else
        echo "Error: Failed to process file" >&2
        return 5  # Processing failed
    fi
}

echo "Demonstrating best practices with validate_and_process function:"

# Create test files
echo "Setting up test environment..."
mkdir -p test_dir
echo "Sample content" > test_dir/input.txt

# Test various scenarios
echo -e "\nTest 1: Valid operation"
validate_and_process "test_dir/input.txt" "test_dir/output.txt"
echo "Exit code: $?"

echo -e "\nTest 2: Missing input file"
validate_and_process "nonexistent.txt" "test_dir/output.txt"
echo "Exit code: $?"

echo -e "\nTest 3: Invalid number of arguments"
validate_and_process "test_dir/input.txt"
echo "Exit code: $?"

# Exit Code Documentation Function
echo -e "\n11. DOCUMENTING EXIT CODES:"
echo "---------------------------"

# Function with well-documented exit codes
process_data() {
    cat << 'EOF'
process_data - Process input data with comprehensive error handling

EXIT CODES:
    0   - Success: Data processed successfully
    1   - Invalid usage: Incorrect number of arguments
    2   - Input error: Input file not found
    3   - Permission error: Input file not readable
    4   - Output error: Output directory not accessible
    5   - Processing error: Data processing failed
    10  - Configuration error: Invalid configuration
    20  - Network error: Network operation failed
    99  - Unknown error: Unexpected error occurred

USAGE:
    process_data <input_file> <output_file>
EOF
}

process_data

# Cleanup and Final Exit Code
echo -e "\n12. CLEANUP AND SCRIPT EXIT:"
echo "----------------------------"

# Cleanup function
cleanup() {
    echo "Performing final cleanup..."
    rm -rf test_dir 2>/dev/null
    rm -f temp_file_*.txt 2>/dev/null
    echo "Cleanup completed successfully"
}

# Perform cleanup
cleanup

# Script completion
echo -e "\n========================================"
echo "    EXIT CODES DEMONSTRATION COMPLETE"
echo "========================================"

echo -e "\nSUMMARY:"
echo "- Exit codes range from 0-255"
echo "- 0 means success, non-zero means error"
echo "- Use \$? to capture the exit code of the last command"
echo "- Use 'return' in functions and 'exit' for scripts"
echo "- Always document your custom exit codes"
echo "- Use consistent exit codes across your scripts"

# Exit with success code
echo -e "\nScript completed successfully!"
exit 0
