#!/bin/bash

# 07-UpdateScript.sh - Demonstrating script updates and version management

echo "========================================"
echo "    SCRIPT UPDATE DEMONSTRATION"
echo "========================================"

# Script Information
SCRIPT_NAME="UpdateScript"
CURRENT_VERSION="1.0.0"
UPDATE_SERVER="example.com"

echo "Script Name: $SCRIPT_NAME"
echo "Current Version: $CURRENT_VERSION"

# Function to display version information
show_version() {
    echo -e "\n1. VERSION INFORMATION:"
    echo "----------------------"
    echo "Script: $SCRIPT_NAME"
    echo "Version: $CURRENT_VERSION"
    echo "Last Updated: $(date)"
    echo "Author: Bash Learning Series"
}

# Function to check for updates (simulated)
check_for_updates() {
    echo -e "\n2. CHECKING FOR UPDATES:"
    echo "------------------------"
    echo "Connecting to update server: $UPDATE_SERVER"
    
    # Simulate checking for updates
    sleep 1
    echo "Checking current version against server..."
    
    # Simulate different update scenarios
    local random_scenario=$((RANDOM % 3))
    
    case $random_scenario in
        0)
            echo "✓ Your script is up to date!"
            return 0
            ;;
        1)
            echo "! Update available: Version 1.1.0"
            AVAILABLE_VERSION="1.1.0"
            return 1
            ;;
        2)
            echo "! Critical update available: Version 1.2.0"
            AVAILABLE_VERSION="1.2.0"
            return 2
            ;;
    esac
}

# Function to backup current script
backup_script() {
    echo -e "\n3. CREATING BACKUP:"
    echo "-------------------"
    
    local backup_dir="backups"
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_file="${backup_dir}/${SCRIPT_NAME}_${CURRENT_VERSION}_${timestamp}.bak"
    
    # Create backup directory if it doesn't exist
    if [ ! -d "$backup_dir" ]; then
        echo "Creating backup directory: $backup_dir"
        mkdir -p "$backup_dir"
    fi
    
    # Create a backup (simulate by copying this script)
    echo "Creating backup: $backup_file"
    cp "$0" "$backup_file" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "✓ Backup created successfully"
        return 0
    else
        echo "✗ Failed to create backup"
        return 1
    fi
}

# Function to simulate downloading update
download_update() {
    local version=$1
    echo -e "\n4. DOWNLOADING UPDATE:"
    echo "----------------------"
    echo "Downloading version $version..."
    
    # Simulate download progress
    local progress=0
    while [ $progress -le 100 ]
    do
        printf "\rProgress: [%-20s] %d%%" $(printf "%*s" $((progress/5)) | tr ' ' '#') $progress
        
        progress=$((progress + 10))
        sleep 0.2
    done
    
    echo -e "\n✓ Download completed successfully"
    return 0
}

# Function to install update
install_update() {
    local version=$1
    echo -e "\n5. INSTALLING UPDATE:"
    echo "---------------------"
    echo "Installing version $version..."
    
    # Simulate installation steps
    echo "• Verifying download integrity..."
    sleep 1
    echo "• Installing new files..."
    sleep 1
    echo "• Updating configuration..."
    sleep 1
    echo "• Cleaning up temporary files..."
    sleep 1
    
    # Update version number (simulation)
    CURRENT_VERSION=$version
    echo "✓ Update installed successfully"
    echo "New version: $CURRENT_VERSION"
    
    return 0
}

# Function to rollback to previous version
rollback_script() {
    echo -e "\n6. ROLLBACK FUNCTIONALITY:"
    echo "-------------------------"
    
    local backup_dir="backups"
    
    # Check if backup directory exists
    if [ ! -d "$backup_dir" ]; then
        echo "✗ No backup directory found"
        return 1
    fi
    
    # List available backups
    echo "Available backups:"
    local backup_count=0
    
    for backup_file in "$backup_dir"/*.bak; do
        if [ -f "$backup_file" ]; then
            backup_count=$((backup_count + 1))
            echo "$backup_count. $(basename "$backup_file")"
        fi
    done
    
    if [ $backup_count -eq 0 ]; then
        echo "✗ No backup files found"
        return 1
    fi
    
    echo "Simulating rollback to most recent backup..."
    sleep 2
    echo "✓ Rollback completed successfully"
    
    return 0
}

# Function to validate script integrity
validate_script() {
    echo -e "\n7. SCRIPT VALIDATION:"
    echo "--------------------"
    
    # Check if script file exists and is readable
    if [ ! -f "$0" ]; then
        echo "✗ Script file not found"
        return 1
    fi
    
    if [ ! -r "$0" ]; then
        echo "✗ Script file is not readable"
        return 1
    fi
    
    # Check script syntax
    echo "Checking script syntax..."
    bash -n "$0" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "✓ Script syntax is valid"
    else
        echo "✗ Script has syntax errors"
        return 1
    fi
    
    # Check file permissions
    if [ -x "$0" ]; then
        echo "✓ Script is executable"
    else
        echo "! Script is not executable (run: chmod +x $0)"
    fi
    
    # Get file size
    local file_size=$(stat -c%s "$0" 2>/dev/null || echo "unknown")
    echo "Script size: $file_size bytes"
    
    return 0
}

# Function to show update history
show_update_history() {
    echo -e "\n8. UPDATE HISTORY:"
    echo "-----------------"
    
    # Simulate update history
    echo "Version History:"
    echo "• v1.0.0 (2025-09-01) - Initial release"
    echo "• v1.1.0 (2025-09-10) - Added error handling"
    echo "• v1.2.0 (2025-09-12) - Performance improvements"
    
    echo -e "\nRecent Changes:"
    echo "• Fixed bug in file processing"
    echo "• Improved user interface"
    echo "• Added backup functionality"
    echo "• Enhanced error messages"
}

# Main update process
main_update_process() {
    echo -e "\n9. COMPLETE UPDATE PROCESS:"
    echo "============================"
    
    # Step 1: Show current version
    show_version
    
    # Step 2: Check for updates
    check_for_updates
    local update_status=$?
    
    if [ $update_status -eq 0 ]; then
        echo "No updates needed."
        return 0
    fi
    
    echo -e "\nUpdate available: $AVAILABLE_VERSION"
    echo "Do you want to proceed with the update? (Simulating 'yes')"
    
    # Simulate user confirmation
    local user_choice="yes"
    echo "User choice: $user_choice"
    
    if [ "$user_choice" = "yes" ]; then
        # Step 3: Create backup
        if backup_script; then
            echo "Backup successful, proceeding with update..."
            
            # Step 4: Download update
            if download_update "$AVAILABLE_VERSION"; then
                echo "Download successful, installing..."
                
                # Step 5: Install update
                if install_update "$AVAILABLE_VERSION"; then
                    echo "Update completed successfully!"
                    
                    # Step 6: Validate installation
                    validate_script
                else
                    echo "Update failed, consider rollback"
                    return 1
                fi
            else
                echo "Download failed, update aborted"
                return 1
            fi
        else
            echo "Backup failed, update aborted for safety"
            return 1
        fi
    else
        echo "Update cancelled by user"
        return 0
    fi
}

# Configuration management
manage_configuration() {
    echo -e "\n10. CONFIGURATION MANAGEMENT:"
    echo "----------------------------"
    
    local config_file="script_config.conf"
    
    # Create sample configuration file
    if [ ! -f "$config_file" ]; then
        echo "Creating configuration file: $config_file"
        cat > "$config_file" << EOF
# Script Configuration
AUTO_UPDATE=false
BACKUP_ENABLED=true
UPDATE_CHECK_INTERVAL=7
MAX_BACKUPS=5
LOG_LEVEL=INFO
EOF
        echo "✓ Configuration file created"
    else
        echo "Configuration file already exists"
    fi
    
    # Read configuration
    echo "Reading configuration:"
    while IFS='=' read -r key value; do
        # Skip comments and empty lines
        if [[ $key =~ ^[[:space:]]*# ]] || [[ -z $key ]]; then
            continue
        fi
        echo "  $key = $value"
    done < "$config_file"
}

# Error handling and logging
handle_errors() {
    echo -e "\n11. ERROR HANDLING:"
    echo "------------------"
    
    # Test different error scenarios
    echo "Testing error scenarios:"
    
    # Test 1: File not found
    echo "Test 1: Checking non-existent file"
    if [ -f "nonexistent_file.txt" ]; then
        echo "✓ File exists"
    else
        echo "✗ File not found (expected error)"
    fi
    
    # Test 2: Permission error simulation
    echo "Test 2: Permission check"
    touch test_file.txt
    chmod 000 test_file.txt 2>/dev/null
    
    if [ -r "test_file.txt" ]; then
        echo "✓ File is readable"
    else
        echo "✗ File permission error (expected)"
    fi
    
    # Cleanup
    chmod 644 test_file.txt 2>/dev/null
    rm -f test_file.txt
    
    # Test 3: Network error simulation
    echo "Test 3: Network connectivity"
    # Simulate network check
    if ping -c 1 localhost > /dev/null 2>&1; then
        echo "✓ Network connectivity OK"
    else
        echo "✗ Network connectivity failed"
    fi
}

# Cleanup function
cleanup_files() {
    echo -e "\n12. CLEANUP:"
    echo "-----------"
    echo "Cleaning up temporary files..."
    
    # Remove temporary files (if any)
    rm -f temp_*.tmp 2>/dev/null
    rm -f script_config.conf 2>/dev/null
    rm -rf backups 2>/dev/null
    
    echo "✓ Cleanup completed"
}

# Main execution
echo -e "\nStarting update script demonstration..."

# Execute all functions
show_version
check_for_updates
backup_script
validate_script
show_update_history
main_update_process
manage_configuration
handle_errors
cleanup_files

echo -e "\nKey concepts demonstrated:"
echo "• Version checking and comparison"
echo "• Backup creation before updates"
echo "• Download progress simulation"
echo "• Installation process"
echo "• Rollback functionality"
echo "• Script validation"
echo "• Configuration management"
echo "• Error handling"
echo "• Cleanup procedures"

echo -e "\nScript completed successfully!"
exit 0
