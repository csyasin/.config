#!/bin/bash

workspaces=$(aerospace list-workspaces --all)

for space in $workspaces; do

  windows="$(aerospace list-windows --workspace "$space")"

  if [ -z "$windows" ]; then
    :
  else
    # 移除已存在的 workspace item，避免重复
    sketchybar --remove "$space" 2>/dev/null

    sketchybar --add item "$space" left \
               --set "$space" label="$space"

    echo "$windows" | while read -r window; do
      appName=$(echo "$window" | awk -F '|' '{print $2}' | sed 's/^ *//;s/ *$//')
      window_id=$(echo "$window" | awk -F '|' '{print $1}' | sed 's/^ *//;s/ *$//')
      item_name="space_${space}_window_${window_id}"

      icon="$($CONFIG_DIR/plugins/icon_map.sh "$appName")"

      app=(
        icon.font="sketchybar-app-font:Regular:14.0"
        icon="$icon"
        label.drawing=off
        padding_left=0
        padding_right=0
      )

      sketchybar --remove "$item_name" 2>/dev/null

      sketchybar --add item "$item_name" left \
                 --set "$item_name" "${app[@]}"
    done
  fi

done