#!/bin/bash

while inotifywait -r -e close_write ~/.config/waybar/; do
  if pgrep -x "waybar" >/dev/null; then
    pkill -USR2 waybar # Recarga Waybar suavemente si está corriendo
  else
    # GTK_DEBUG=interactive waybar & # Reinicia con GTK_DEBUG si se cerró
    waybar & 
  fi
done

# https://gist.github.com/KernelDiego/313f53cec57c91ca8af124732d75b934
