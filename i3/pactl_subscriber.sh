#!/bin/bash

while read -r event; do
    if echo "$event" | grep -q "'change' on"; then
        pkill -RTMIN+2 i3blocks
    fi
done < <(pactl subscribe)
