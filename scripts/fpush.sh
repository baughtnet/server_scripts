#!/bin/bash

echo "Welcome to File Push!"
echo "This script will copy a file to multiple hosts."
clear

# Check if the required arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <file_to_push> <username> <host_file>"
    exit 1
fi

# Extract command-line arguments
FILE_TO_PUSH="$1"
USERNAME="$2"
HOST_FILE="$3"

# Check if the file to push exists
if [ ! -e "$FILE_TO_PUSH" ]; then
    echo "Error: File not found - $FILE_TO_PUSH"
    exit 1
fi

# Check if the host file exists
if [ ! -e "$HOST_FILE" ]; then
    echo "Error: Host file not found - $HOST_FILE"
    exit 1
fi

# Read hosts from the host file into an array
IFS=$'\r\n' GLOBIGNORE='*' command eval 'HOSTS=($(cat "$HOST_FILE"))'

# Loop through each host and use rsync to copy the file
for HOST in "${HOSTS[@]}"
do
    echo "Copying $FILE_TO_PUSH to $USERNAME@$HOST..."
    rsync -avz "$FILE_TO_PUSH" "$USERNAME@$HOST:/home/$USERNAME/"
done

echo "Done!"
