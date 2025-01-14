#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Run two processes concurrently that write to the files
(echo "Process 1" > file1.txt) &
(echo "Process 2" > file2.txt) &

# Wait for the processes to finish
wait

# Check the contents of the files - they might be incomplete or overwritten depending on the race condition.
cat file1.txt
cat file2.txt

# Clean up
rm file1.txt file2.txt