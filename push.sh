#!/bin/bash

# declare some empty variables for input
HOSTS_INPUT=()
HOSTS=()

# Prompt user for action, either push a file with rsync or send a command to a remote host
read -p "Do you want to push a file with rsync or send a command to a remote host? ( (p)ush | (c)ommand | e(x)it): " ACTION

if [ $ACTION == "p" ]; then

# Prompt user for input
    read -p "Enter the local path to copy from: " LOCAL_PATH
    read -p "Enter the relative remote path to copy to: " RELATIVE_REMOTE_PATH
    read -p "Enter the username to use: " USERNAME
    read -p "Enter a comma-separated list of hosts: " HOSTS_INPUT

    # Check if multiple hosts were entered
    if [ "${#HOSTS[@]}" -le 1 ]; then
        echo "Single host entered | $HOSTS_INPUT"
        FULL_REMOTE_PATH="${USERNAME}@${HOSTS_INPUT}:${RELATIVE_REMOTE_PATH}"
        echo "Copying $LOCAL_PATH on your local machine to $RELATIVE_REMOTE_PATH on the remote host $HOSTS_INPUT..."
        rsync -avz "$LOCAL_PATH" "$FULL_REMOTE_PATH"
        echo "Done!"
        exit 0
    fi

    # Split the input into an array of hosts
    IFS=', ' read -ra HOSTS <<< "$HOSTS_INPUT"

    for HOST in "${HOSTS[@]}"
    do
        echo "$HOST"
    done

# Loop through each host and use rsync to copy the file
    for HOST in "${HOSTS[@]}"
    do
        # Construct the full remote path by concatenating the home directory and the relative path
        FULL_REMOTE_PATH="${USERNAME}@${HOST}:${RELATIVE_REMOTE_PATH}"
        
        echo "Copying $LOCAL_PATH to $FULL_REMOTE_PATH..."
        rsync -avz "$LOCAL_PATH" "$FULL_REMOTE_PATH"

        echo "Done!"
        exit 0
    done
fi

if [ $ACTION == "c" ]; then
    read -p "Enter the command to send: " COMMAND
    read -p "Enter the username to use: " USERNAME
    read -p "Enter a comma-separated list of hosts: " HOSTS_INPUT

    # Check if multiple hosts were entered
    if [ "${#HOSTS[@]}" -le 1 ]; then
        ssh ${USERNAME}@${HOSTS_INPUT} ${COMMAND}
        echo "Done!"
        exit 0
    fi

    # Split the input into an array of hosts
    IFS=', ' read -ra HOSTS <<< "$HOSTS_INPUT"

    for HOST in "${HOSTS[@]}"
    do
        ssh ${USERNAME}@${HOSTS} ${COMMAND}
        echo "Done!"
        exit 0
    done
fi

    # ssh user@$HOST "tmux new-session -d -s update-session '$UPDATE_COMMAND'; tmux split-window -h -p 50 'htop'; tmux attach -t update-session"
