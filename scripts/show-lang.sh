#!/bin/bash
# Show current keyboard layout, useful for i3blocks.

truncate_and_escape() {
	sed -r 's/(.{100}).*/\1/g; s/([\"])/\\\1/g;'
}

xkb-switch | awk '{print toupper($0)}' | truncate_and_escape
