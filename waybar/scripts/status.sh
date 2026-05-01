#!/usr/bin/env sh

result=$(curl https://status.serguzim.net/api/status-page/heartbeat/serguzim-net |
  jq '.heartbeatList | to_entries | map(.value | last .status) 
		| [group_by(.)[] | {value: .[0], count: length}] | map({(.value|tostring): .count}) | add')

up_count=$(echo "$result" | jq '."1" // 0')
down_count=$(echo "$result" | jq '."0" // 0')
count=$((up_count + down_count))
percent=$((up_count * 100 / count))

tooltip="status.serguzim.net\nUp: $up_count\nDown: $down_count\nTotal: $count\nPercent: $percent%"

echo "{\"text\": \"$percent%\", \"tooltip\": \"$tooltip\"}"
