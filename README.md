# Shell Script Race Condition Bug

This repository demonstrates a race condition bug in a simple shell script.  Two processes attempt to write to files concurrently without any synchronization, leading to unpredictable output.  The solution demonstrates using proper synchronization mechanisms to prevent this race condition.

## Bug Description:
The `bug.sh` script creates two files and runs two processes in the background, each writing to one of the files.  Due to the concurrent nature of these operations, the final content of the files is undefined and might be incomplete or overwritten.

## Solution:
The `bugSolution.sh` script addresses this issue by using locks to serialize file access. This ensures that only one process can write to the files at a time, preventing data corruption or loss.  This example uses file locking, but other synchronization methods like semaphores are also applicable depending on the system and requirements.