#!/bin/bash

# Get the arguments
filename=$1
dest_folder=$2

# Get a list of all devices in the network
devices=$(ip addr | grep -E "inet (192.168.0.[0-9]+)" | tr -d " " | sort)

# Loop through the devices and copy the file
success_count=0
fail_count=0
for device in $devices; do
    echo "Copying file to $device"
    ssh $device "mkdir -p $dest_folder"
    if scp $filename $device:$dest_folder; then
        echo "Success: $device (IP: $ip)"
        success_count=$((success_count + 1))
    else
        echo "Fail: $device (IP: $ip)"
        fail_count=$((fail_count + 1))
    fi
done