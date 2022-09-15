#!/bin/bash

apagar="⏻  off"
suspender="  suspend"
bloquear="  lock"
logout="  logout"

OPTIONS="${apagar}\n${suspender}\n${bloquear}\n${logout}"
ans=$(echo -e "${OPTIONS}" | rofi -p "rxtsel" -dmenu)
rs=$?
if [ $rs -eq 0 ]
then
    case "$ans" in
        "$apagar")
            systemctl poweroff
            ;;
        "$suspender")
            systemctl suspend
            ;;
        "$bloquear")
            betterlockscreen -l
            ;;
        "$logout")
            bspc quit
            ;;
    esac
fi
