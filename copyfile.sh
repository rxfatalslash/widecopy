#!/bin/bash

CRE=$(tput setaf 1)
CGR=$(tput setaf 2)
BLD=$(tput bold)
CNC=$(tput sgr0)

# Get the arguments
filename=$1
dest_folder=$2

logo () {

    local text="${1:?}"
    echo "
    WOdddddxk0KNW                                            WNK0kxdddddOW 
     Wo........',:lx0N                                    N0xl:,'........oW 
      Xc.,clcc:;'....;lON                              NOl;....';:cclc,.cX  
       Kc'cdodlc::ccc;..:kN                          Nk:..;ccc::cldodc'cK   
        Xo;:loooooooool:,'cK                        Kc',:loooooooool:;oX    
         WKxolccclllllllc;';OW                    WO;';clllllllcccloxKW     
            WNKOOOOkkkOkkkdokN                    NkodkkkOkkkOOOOKNW       
    \n\n"
    printf ' %s [%s%s %s%s %s]%s\n\n' "${CRE}" "${CNC}" "${CYE}" "${text}" "${CNC}" "${CRE}" "${CNC}"
}

# List of devices
devices=()
for octeto in {10..150}; do
    devices+=("192.168.1.$octeto")
done

logo "rxfatalslash"
printf "%s%sIniciando proceso de copia...%s" "${BLD}" "${CRE}" "${CNC}"
sleep 3

# Open multiple SSH sessions
for device in "${devices[@]}"; do
    scp $filename $USER@$device:$dest_folder > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        printf "$device [%sSUCCESS%s]\n" "${CGR}" "${CNC}"
    else
        printf "$device [%sFAIL%s]\n" "${CRE}" ${CNC}
    fi
done