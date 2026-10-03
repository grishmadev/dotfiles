#!/bin/bash
chosen=$(echo -e "󰌾 Lock\n Poweroff\n󰑐 Reboot\n󰤄 Suspend\n󰗽 Logout" | rofi -dmenu -p "Power")
case "$chosen" in
"󰌾 Lock") slock ;;
" Poweroff") loginctl poweroff ;;
"󰑐 Reboot") loginctl reboot ;;
"󰤄 Suspend")
  slock &
  loginctl suspend
  ;;
"󰗽 Logout") i3-msg exit ;;
esac
