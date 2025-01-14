#!/bin/bash

# This script demonstrates a solution to the race condition bug using file locking.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to a file safely using flock
write_to_file() {
  local file=$1
  local message=$2
  flock -n $file || exit 1 # Acquire an exclusive lock on the file
  echo "$message" > "$file"
  flock -u $file # Release the lock
}

# Write to file1 using the safe function
write_to_file file1.txt "Process 1"

# Write to file2 using the safe function
write_to_file file2.txt "Process 2"

# Check the contents of the files - they are now written safely.
cat file1.txt
cat file2.txt

# Clean up
rm file1.txt file2.txt