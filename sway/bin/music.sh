#!/usr/bin/env bash

# Fetch artist - title, suppress error output if no player is active
if playerctl status >/dev/null 2>&1; then
  playerctl metadata --format '{{title}} - {{artist}}'
else
  echo "No media playing"
fi
