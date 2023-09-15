#!/bin/bash

# Get the arguments
filename=$1
dest_folder=$2

# List of devices
devices=()
for octeto in {10..150}; do
    devices+=("192.168.1.$octeto")
done

# Open multiple SSH sessions
for device in $devices; do
    echo "Opening SSH session to $device"
    ssh $device "mkdir -p $dest_folder"
    ssh $device "scp $filename $dest_folder" &
done

# Wait for all SSH sessions to finish
wait