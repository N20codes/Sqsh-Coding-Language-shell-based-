#!/bin/bash

echo -e "\033[0;31m'Welcome To sqshlang\033[0m"
echo "============================="
echo " type dir for directory loc "

read -p "sqsh@\$lang:~$" cmd

if [ "$cmd" == "dir" ]; then
    pwd

elif [ "$cmd" == "monitor" ]; then
    clear
    while true; do
        device_monitor=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' | cut -d. -f1)
        if [[ -z "$device_monitor" ]]; then device_monitor=0; fi

        scale=$(( device_monitor / 10 ))
        bar=$(printf "%-${scale}s" "#" | tr ' ' '#')
        bar_kosong=$(printf "%-$((10 - scale))s" "." | tr ' ' '.')

        if [ $device_monitor -lt 40 ]; then
            digital_color="\033[1;32m" # Hijau
        elif [ $device_monitor -lt 75 ]; then
            digital_color="\033[1;33m" # Kuning
        else
            digital_color="\033[1;31m" # Merah
        fi

        clear
        echo -e "Digital Monitor CPU: ${digital_color}[ ${device_monitor}% ]\033[0m"
        echo -e "Bar: [${bar}${bar_kosong}]"
        echo -e "Press [q] To exit..."

        read -t 1 -n 1 button_input
        if [[ "$button_input" == "q" || "$button_input" == "Q" ]]; then
            clear
            break
fi
done
else
    echo -e "\033[1;31mSquiscript Error: ($cmd) is invalid!\033[0m"

fi
