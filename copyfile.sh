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
for device in "${devices[@]}"; do
    scp $filename $USER@$device:$dest_folder
done

# Wait for all SSH sessions to finish
wait

echo "Tarea terminada con éxito"