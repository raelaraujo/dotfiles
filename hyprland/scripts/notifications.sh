#!/usr/bin/env bash
count=$(timeout 2 swaync-client --skip-wait --count 2>/dev/null | tr -d '[:space:]' || true)
dnd=$(timeout 2 swaync-client --skip-wait --get-dnd 2>/dev/null | tr -d '[:space:]' || true)

if [[ "$dnd" == "true" ]]; then
  echo "󰤇"
elif [[ "$count" =~ ^[0-9]+$ ]] && (( count > 0 )); then
  echo "󰤃 $count"
else
  echo "󰤃"
fi
