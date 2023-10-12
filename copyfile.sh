#!/bin/bash

CRE=$(tput setaf 1)
CGR=$(tput setaf 2)
CNC=$(tput sgr0)

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
    scp $filename $USER@$device:$dest_folder > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        printf "$device [%sSUCCESS%s]\n" "${CGR}" "${CNC}"
    else
        printf "$device [%sFAIL%s]\n" "${CRE}" ${CNC}
    fi
done

# Wait for all SSH sessions to finish
wait

echo "Tarea terminada con éxito"
