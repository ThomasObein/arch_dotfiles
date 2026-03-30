#!/bin/bash

shutdown="󰐥 Shutdown"
reboot="󰜉 Reboot"
lock="󰌾 Lock"
suspend="󰤄 Suspend"
logout="󰍃 Logout"

chosen=$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -i -p "Power")

# Avoid menu still showing
if [ -n "$chosen" ]; then
    pkill rofi
    sleep 0.1
fi

case "$chosen" in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$lock")
        hyprlock
        ;;
    "$suspend")
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    "$logout")
        hyprctl dispatch exit 0
        ;;
esac
