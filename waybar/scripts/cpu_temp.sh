#!/usr/bin/env bash

SENSORS=$(sensors)
TEMP=$(echo "$SENSORS" "k10temp-pci-00c3" 2>/dev/null | grep "Tctl:" | awk '{print $2}')

# fallback
if [[ -z "$TEMP" ]]; then
  CLASS="unknown"
  FORMAT="<span color='#ebdbb2' bgcolor='#555555' >  </span> N/A°C"
  printf '{"text":"%s","class":"%s"}\n' "$FORMAT" "$CLASS"
  exit 0
fi

# Convert TEMP to an integer (remove decimal part)
TEMP_F=$(printf "%.1f" "$TEMP")

if (( TEMP_F >= 70 )); then
  CLASS="critical"
  FORMAT="<span color='#E46876'> </span>${TEMP_F}°C"
else
  CLASS="normal"
  FORMAT="<span color='#E46876'>󰴈 </span>${TEMP_F}°C"
fi

# print JSON with both text and class
printf '{"text":"%s","class":"%s"}\n' "$FORMAT" "$CLASS"
