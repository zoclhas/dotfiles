#!/bin/bash

INTERFACE=$(ip route | awk '/default/ {print $5; exit}')
[ -z "$INTERFACE" ] && INTERFACE="eth0" # fallback

# Store last stats in a temp file
CACHE_FILE="/tmp/waybar_net_${INTERFACE}"

RX_PREV=0
TX_PREV=0
TIME_PREV=0

if [ -f "$CACHE_FILE" ]; then
  read RX_PREV TX_PREV TIME_PREV <"$CACHE_FILE"
fi

RX_NOW=$(cat /sys/class/net/"$INTERFACE"/statistics/rx_bytes)
TX_NOW=$(cat /sys/class/net/"$INTERFACE"/statistics/tx_bytes)
TIME_NOW=$(date +%s)

DT=$((TIME_NOW - TIME_PREV))
[ "$DT" -eq 0 ] && DT=1

DOWN_BPS=$(((RX_NOW - RX_PREV) / DT))
UP_BPS=$(((TX_NOW - TX_PREV) / DT))

if [ $DOWN_BPS -gt 1048576 ]; then
  DOWN_FMT="$(awk "BEGIN{printf \"%.1fMB/s\", $DOWN_BPS/1048576}")"
elif [ $DOWN_BPS -gt 1024 ]; then
  DOWN_FMT="$(awk "BEGIN{printf \"%.1fKB/s\", $DOWN_BPS/1024}")"
else
  DOWN_FMT="${DOWN_BPS}B/s"
fi

if [ $UP_BPS -gt 1048576 ]; then
  UP_FMT="$(awk "BEGIN{printf \"%.1fMB/s\", $UP_BPS/1048576}")"
elif [ $UP_BPS -gt 1024 ]; then
  UP_FMT="$(awk "BEGIN{printf \"%.1fKB/s\", $UP_BPS/1024}")"
else
  UP_FMT="${UP_BPS}B/s"
fi

echo "{\"down\":\"$DOWN_FMT\",\"up\":\"$UP_FMT\"}"

echo "$RX_NOW $TX_NOW $TIME_NOW" >"$CACHE_FILE"
