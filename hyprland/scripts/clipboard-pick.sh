#!/usr/bin/env bash
selection=$(cliphist list | wofi --dmenu --prompt "clipboard" --width 700) || exit 0
[[ -z "$selection" ]] && exit 0
printf '%s\n' "$selection" | cliphist decode | wl-copy
