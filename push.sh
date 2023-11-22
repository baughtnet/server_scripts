#!/bin/bash

# Prompt user for input
read -p "Enter the local path to copy from: " LOCAL_PATH
read -p "Enter the remote path to copy to: " REMOTE_PATH
read -p "Enter the username to use: " USERNAME
read -p "Enter a comma-separated list of hosts: " HOSTS_INPUT

# Check if the local path exists
if [ ! -e "$LOCAL_PATH" ]; then
    echo "Error: Local path not found - $LOCAL_PATH"
    exit 1
fi

# Check if the host file exists
if [ ! -e "$HOST_FILE" ]; then
    echo "Error: Host file not found - $HOST_FILE"
    exit 1
fi

# Split the input into an array of hosts
IFS=', ' read -ra HOSTS <<< "$HOSTS_INPUT"

# Loop through each host and use rsync to copy the file

for HOST in "${HOSTS[@]}"
do
    echo "Copying $LOCAL_PATH to $USERNAME@$HOST:$REMOTE_PATH..."
    rsync -avz "$LOCAL_PATH" "$USERNAME@$HOST:$REMOTE_PATH"
done

echo "Done!"
