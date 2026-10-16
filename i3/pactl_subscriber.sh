#!/bin/bash

pactl subscribe | while read -r event; do
    if [[ "$event" =~ Event\ \'change\'\ on\ (sink|server) ]]; then
        pkill -RTMIN+2 -x i3blocks
    fi
done
