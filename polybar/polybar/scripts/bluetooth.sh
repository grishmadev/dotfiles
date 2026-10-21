#!/bin/bash

# Check if bluetooth is powered on
if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo ""
  exit 0
fi

# Get the name of the connected device
device=$(bluetoothctl info | grep "Name" | cut -d ' ' -f 2-)

if [ -z "$device" ]; then
  echo ""
else
  echo "󰂱 $device"
fi
