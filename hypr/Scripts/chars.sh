#!/bin/bash

# Path to your special characters list
CHAR_FILE="$HOME/.config/hypr/conf/chars.txt"

# Clipboard utility (xclip for X11, wl-copy for Wayland)
CLIP_CMD="xclip -selection clipboard"

# Check if file exists
if [ ! -f "$CHAR_FILE" ]; then
    echo "Special characters file not found at $CHAR_FILE"
    exit 1
fi

# Display rofi menu and get selected character
SELECTION=$(awk -F':' '{print $1 " - " $2}' "$CHAR_FILE" | rofi -dmenu -p "Special Characters:")

# Extract character (before " - ")
CHAR=$(echo "$SELECTION" | awk -F' - ' '{print $1}')

# Exit if no selection
if [ -z "$CHAR" ]; then
    exit 1
fi

# Copy to clipboard
echo "$CHAR" | wl-copy

# Notify user
notify-send "Copied to clipboard: $CHAR"
