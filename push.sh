#!/bin/bash

# Prompt user for input
read -p "Enter the local path to copy from: " LOCAL_PATH
read -p "Enter the relative remote path to copy to: " RELATIVE_REMOTE_PATH
read -p "Enter the username to use: " USERNAME
read -p "Enter a comma-separated list of hosts: " HOSTS_INPUT

# Check if multiple hosts were entered
if [ "$HOSTS_INPUT >= 12" ]; then
    FULL_REMOTE_PATH="${USERNAME}@${HOSTS_INPUT}:${RELATIVE_REMOTE_PATH}"
    echo "Copying $LOCAL_PATH on your local machine to $RELATIVE_REMOTE_PATH on the remote host $HOSTS_INPUT..."
    rsync -avz "$LOCAL_PATH" "$FULL_REMOTE_PATH"
    echo "Done!"
    exit 0
fi

# Split the input into an array of hosts
IFS=', ' read -ra HOSTS <<< "$HOSTS_INPUT"

# Loop through each host and use rsync to copy the file
for HOST in "${HOSTS[@]}"
do
    # Construct the full remote path by concatenating the home directory and the relative path
    FULL_REMOTE_PATH="${USERNAME}@${HOST}:${RELATIVE_REMOTE_PATH}"
    
    echo "Copying $LOCAL_PATH to $FULL_REMOTE_PATH..."
    rsync -avz "$LOCAL_PATH" "$FULL_REMOTE_PATH"
done

echo "Done!"
