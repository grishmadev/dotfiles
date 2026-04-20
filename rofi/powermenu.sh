#!/bin/bash
chosen=$(echo -e "󰌾 Lock\n Poweroff\n󰑐 Reboot\n󰤄 Suspend\n󰗽 Logout" | rofi -dmenu -p "Power")
case "$chosen" in
"󰌾 Lock") exec ~/.i3/bin/i3lock.sh ;;
" Poweroff") poweroff ;;
"󰑐 Reboot") reboot ;;
"󰤄 Suspend") exec ~/.i3/bin/i3lock.sh && systemctl suspend ;;
"󰗽 Logout") i3-msg exit ;;
esac
