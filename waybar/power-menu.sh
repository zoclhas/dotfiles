#!/bin/bash

# Array of options
options=(
    " Lock"
    " Reboot"
    " Shutdown"
    " Logout"
)

# Function to display menu and get user selection
show_menu() {
    printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "Power Menu" -theme-str 'window {width: 300px;}'
}

# Get user selection
choice=$(show_menu)

# Execute the chosen command
case $choice in
    " Lock")
        hyprlock
        ;;
    " Reboot")
        reboot
        ;;
    " Shutdown")
        poweroff
        ;;
    " Logout")
        hyprctl dispatch exit
        ;;
esac
