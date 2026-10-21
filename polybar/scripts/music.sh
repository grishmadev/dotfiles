#!/bin/bash

# Get the metadata
metadata=$(playerctl metadata --format "{{ title }}" 2>/dev/null)

# Set the threshold
MAX_LEN=25

if [ -z "$metadata" ]; then
  echo "" # Show nothing if no music is playing
elif [ ${#metadata} -gt $MAX_LEN ]; then
  # Slice the string and add the dots
  echo "${metadata:0:$MAX_LEN}..."
else
  echo "$metadata"
fi
