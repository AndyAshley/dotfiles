#!/bin/sh
hour=$(date +"%I")
minute=$(date +"%M")
ampm=$(date +"%p")

# Remove leading zero if the hour doesn't start with 1
if [ "$hour" -lt 10 ]; then
    hour=$(echo "$hour" | sed 's/^0//')
fi

echo "$hour:$minute $ampm"